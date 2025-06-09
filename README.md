🚀 Contrato de Subasta en Solidity
Este es un contrato de Solidity diseñado para un sistema de subastas en la blockchain de Ethereum. Permite a los usuarios participar, pujar y gestionar sus fondos de manera eficiente.

✨ Características Principales
Contrato de Subasta: Un contrato robusto que habilita a los usuarios a participar activamente en subastas, realizar pujas y retirar los fondos excedentes.
Gestión del Propietario: El propietario del contrato tiene la flexibilidad de finalizar la subasta en cualquier momento que lo considere oportuno.
Incremento Mínimo de Puja: Para asegurar una competencia dinámica, cada nueva puja debe ser al menos un 5 % superior a la puja más alta anterior.
Tasa de Comisión: Una comisión del 2 % se aplica a cada puja ganadora, la cual se transfiere directamente al propietario del contrato.
🛠️ Funciones Clave
bid(): Permite a los usuarios realizar una puja en la subasta.
returnExcess(): Habilita a los postores que no lideran la subasta a retirar los fondos excedentes (es decir, las cantidades superiores a la puja más alta final).
endAuction(): Finaliza la subasta y transfiere el monto ganador, menos la comisión, al propietario del contrato.
🔍 Obtenedores (Getters)
getBidders(): Devuelve un array con las direcciones de los postores y sus pujas correspondientes.
getWinner(): Recupera la dirección y el monto de la puja del ganador actual o final de la subasta.
timeLeft(): Calcula y devuelve el tiempo restante en minutos antes de que finalice la subasta (o 0 si ya ha concluido).

