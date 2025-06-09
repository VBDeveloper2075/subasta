🚀 Contrato de Subasta en Solidity
📋 Descripción
Este es un smart contract de Solidity diseñado para gestionar un sistema de subastas en la blockchain de Ethereum. Permite a los usuarios participar de forma segura, pujar por ítems y gestionar sus fondos de manera transparente y descentralizada.

✨ Características
Sistema de Subastas Completo: Un contrato robusto que habilita a los usuarios a participar activamente, realizar pujas y retirar fondos excedentes.
Control del Propietario: El propietario del contrato tiene la capacidad de finalizar la subasta en cualquier momento.
Incremento Mínimo de Puja: Para fomentar una competencia justa, cada nueva puja debe ser al menos un 5 % superior a la puja más alta anterior.
Comisión Transparente: Se aplica una comisión del 2 % a cada puja ganadora, la cual se transfiere directamente al propietario del contrato.
🛠️ Tecnología Utilizada
Este proyecto está desarrollado principalmente en:

Solidity (Lenguaje de Smart Contracts para Ethereum)

Sobre la blockchain de Ethereum El entorno de desarrollo recomendado es:
Remix IDE
⚙️ Instalación y Despliegue
Requisitos Previos
Acceso a un navegador web.
Conexión a internet.
(Opcional) Una extensión de monedero como MetaMask para interactuar con redes Ethereum reales o de prueba.
Pasos de Despliegue en Remix
Clona o Copia el Código: Si tienes el código localmente, puedes arrastrar y soltar el archivo .sol en la sección "File Explorers" de Remix. Si lo tienes en un repositorio Git, puedes clonarlo directamente en Remix (usando el icono de Git en el explorador de archivos).
Bash

# Ejemplo para clonar en tu entorno local (si no usas Remix directamente para Git)
git clone [URL_DEL_REPOSITORIO]
cd nombre-del-repositorio
Abre en Remix IDE: Ve a Remix Ethereum IDE.
Carga el Contrato: En la pestaña "File Explorers" (icono de carpeta a la izquierda), puedes crear un nuevo archivo .sol y pegar el contenido de tu contrato, o cargar el archivo existente.
Compila el Contrato: Navega a la pestaña "Solidity Compiler" (icono de la hoja de papel con un check). Asegúrate de que la versión del compilador sea compatible con el pragma de tu contrato (ej. ^0.8.0). Haz clic en "Compile [NombreDeTuContrato].sol".
Despliega el Contrato: Dirígete a la pestaña "Deploy & Run Transactions" (icono de Ethereum con un triángulo).
Environment: Selecciona el entorno. Para pruebas rápidas, "JavaScript VM" es ideal. Para redes reales o de prueba, selecciona "Injected Provider - MetaMask".
Asegúrate de que tu contrato esté seleccionado en el dropdown "Contract".
Haz clic en "Deploy". Si estás en una red real, MetaMask te pedirá confirmar la transacción y el gas.
Interactúa: Una vez desplegado, verás tu contrato en la sección "Deployed Contracts". Puedes expandirlo para interactuar con sus funciones bid(), endAuction(), getWinner(), etc.
📊 Estructura del Proyecto
tu-repositorio-de-subasta/
├── contracts/           # Carpeta que contendrá tu archivo .sol (o archivos .sol si hay varios)
│   └── Auction.sol      # Archivo principal de tu contrato de subasta
├── README.md            # Este archivo
└── (otros archivos, ej: scripts de prueba, configuraciones)
💡 Uso
Una vez desplegado, puedes interactuar con el contrato de la siguiente manera:

📝 Realizar una Puja (bid): Envía ETH al contrato a través de la función bid(). Asegúrate de que tu monto sea al menos un 5% mayor que la puja actual más alta.
🔄 Retirar Excedentes (returnExcess): Si tu puja fue superada, pero enviaste más ETH de lo necesario, puedes llamar a returnExcess() para recuperar la diferencia.
🏁 Finalizar la Subasta (endAuction): El propietario del contrato puede llamar a esta función para concluir la subasta. El ETH del ganador, menos la comisión, se transferirá al propietario.
🔍 Consultar Ganador (getWinner): Llama a esta función para saber quién es el ganador actual y su puja.
⏳ Ver Tiempo Restante (timeLeft): Consulta esta función para conocer cuántos minutos quedan hasta que finalice la subasta.
👥 Contribución
¡Las contribuciones son siempre bienvenidas! Si deseas mejorar este contrato o añadir nuevas funcionalidades:

Haz un fork del repositorio.
Crea una rama para tu característica: git checkout -b feature/nueva-funcionalidad
Haz commit de tus cambios: git commit -m 'Añade nueva funcionalidad'
Sube tu rama: git push origin feature/nueva-funcionalidad
Abre un Pull Request detallando tus cambios.
📄 Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE en el repositorio para más detalles.

Desarrollado con ❤️ en Argentina por Verito - 2025
-- con Ayuda de JP https://www.youtube.com/@cleancode8493 ---
