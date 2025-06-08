pragma solidity ^0.8.30;

contract Auction {
    address public owner;
    address public highestBidder;
    uint256 public highestBid;
    uint256 public endTime;
    bool public ended;
    uint256 private constant MIN_BID_INCREASE = 5; // 5% incremento mínimo
    uint256 private constant COMMISSION_RATE = 2; // 2% comisión
    uint256 private constant TIME_EXTENSION = 10 minutes;
    
    // registro de ofertas por dirección
    mapping(address => uint256) public bids;
    // historial ofertas
    address[] public bidders;
  
    event NewBid(address indexed bidder, uint256 amount);
    event AuctionEnded(address indexed winner, uint256 amount);
    event Withdrawn(address indexed bidder, uint256 amount);
    
    // Modificadores
    modifier onlyOwner() {
        require(msg.sender == owner, "No eres el dueno");
        _;
     }
    
    modifier auctionActive() {
        require(block.timestamp < endTime, "Subasta finalizada");
        require(!ended, "Subasta ya cerrada");
        _;
    }
    
    // Constructor
    constructor(uint256 _duration) {
        owner = msg.sender;
        endTime = block.timestamp + _duration;
    }
    
    //hacer las ofertas
    function bid() external payable auctionActive {
        // Verificar que la oferta sea mayor en 5% que la actual
        require(msg.value > 0, "La oferta debe ser mayor a cero");
        uint256 totalBid = bids[msg.sender] + msg.value;
        
        require(
            totalBid >= highestBid + (highestBid * MIN_BID_INCREASE / 100),
            "Oferta insuficiente"
        );
        
        // Si es primera oferta del participante, agregarlo al historial
        if (bids[msg.sender] == 0) {
            bidders.push(msg.sender);
        }
        
        // Actualizar oferta del usuario
        bids[msg.sender] = totalBid;
        
        // Actualizar oferta más alta si corresponde
        if (totalBid > highestBid) {
            highestBidder = msg.sender;
            highestBid = totalBid;
        // Extender subasta si estamos en los últimos 10 minutos
            if (block.timestamp + TIME_EXTENSION > endTime) {
                endTime = block.timestamp + TIME_EXTENSION;
            }
            emit NewBid(msg.sender, totalBid);
        }
    }
    
    // Función para retirar fondos por encima de la oferta actual
    function withdrawExcess() external {
        uint256 currentBid = bids[msg.sender];
        
        // Sólo se puede retirar si no es el mayor oferente o si tiene exceso
        if (msg.sender == highestBidder) {
            uint256 minRequired = highestBid;
            require(currentBid > minRequired, "No hay exceso para retirar");
            
            uint256 excessAmount = currentBid - minRequired;
            bids[msg.sender] = minRequired;
            
            (bool sent, ) = msg.sender.call{value: excessAmount}("");
            require(sent, "Error al enviar ETH");
            
            emit Withdrawn(msg.sender, excessAmount);
        } else if (currentBid > 0) {
            // No es el mayor oferente, puede retirar todo
  bids[msg.sender] = 0;
            
            (bool sent, ) = msg.sender.call{value: currentBid}("");
            require(sent, "Error al enviar ETH");
            
            emit Withdrawn(msg.sender, currentBid);
        }
    }
    
    // Finalizar la subasta
    function endAuction() external {
        require(block.timestamp > endTime || msg.sender == owner, "Subasta en curso");
        require(!ended, "Subasta ya finalizada");
        
        ended = true;
  // Calcular la comisión
        uint256 commission = (highestBid * COMMISSION_RATE) / 100;
        uint256 paymentToOwner = highestBid - commission;
        
        // Transferir al dueño
        (bool sent, ) = owner.call{value: paymentToOwner}("");
        require(sent, "Error al enviar ETH al dueno");
        
        emit AuctionEnded(highestBidder, highestBid);
    }
    
    // Función para obtener lista de oferentes y montos
    function getBidders() external view returns (address[] memory, uint256[] memory) {
        uint256[] memory amounts = new uint256[](bidders.length);
        
        for (uint i = 0; i < bidders.length; i++) {
            amounts[i] = bids[bidders[i]];
        }
        
        return (bidders, amounts);
    }
    
    // Obtener ganador actual/final
    function getWinner() external view returns (address, uint256) {
        return (highestBidder, highestBid);
    }
    
    // Tiempo restante en la subasta
    function timeLeft() external view returns (uint256) {
        if (block.timestamp >= endTime) return 0;
        return endTime - block.timestamp;
    }
}


    
