🚀 Contrato de Subasta en Solidity
Este es un smart contract de Solidity diseñado para gestionar un sistema de subastas en la blockchain de Ethereum. Permite a los usuarios participar de forma segura, pujar por ítems y gestionar sus fondos de manera transparente.

✨ Características Principales
Sistema de Subastas Completo: Un contrato robusto que habilita a los usuarios a participar activamente, realizar pujas y retirar fondos excedentes.
Control del Propietario: El propietario del contrato tiene la capacidad de finalizar la subasta en cualquier momento.
Incremento Mínimo de Puja: Para fomentar una competencia justa, cada nueva puja debe ser al menos un 5 % superior a la puja más alta anterior.
Comisión Transparente: Se aplica una comisión del 2 % a cada puja ganadora, la cual se transfiere directamente al propietario del contrato.
🛠️ Cómo Interactuar (Funciones Clave)
Estas son las funciones principales con las que los usuarios y el propietario interactuarán:

bid(): Permite a cualquier usuario realizar una puja en la subasta, enviando ETH con su transacción.
returnExcess(): Habilita a los postores que no lideran la subasta a retirar cualquier ETH excedente de sus pujas anteriores. Esto ocurre si su puja fue superada, pero enviaron más de lo necesario para la puja ganadora.
endAuction(): Función exclusiva del propietario del contrato para finalizar la subasta. Una vez finalizada, el monto de la puja ganadora (menos la comisión) se transfiere al propietario.
📊 Consulta de Datos (Getters)
El contrato también ofrece funciones para consultar su estado actual sin costo de gas:

getBidders(): Devuelve un array con las direcciones de los postores y sus pujas correspondientes. Ideal para ver la actividad de la subasta.
getWinner(): Recupera la dirección y el monto de la puja del ganador actual o final de la subasta.
timeLeft(): Calcula y devuelve el tiempo restante en minutos antes de que finalice la subasta (o 0 si ya ha concluido).
💻 Tecnología
Este proyecto está desarrollado en:

Solidity (Lenguaje de Smart Contracts)

Sobre la blockchain de Ethereum El entorno de desarrollo utilizado es:
Remix IDE
🚀 Cómo Clonar e Inicializar el Proyecto
Para poner en marcha este proyecto en tu entorno local, sigue estos pasos:

Clonar el Repositorio:
Abre tu terminal o Git Bash y ejecuta el siguiente comando:

Bash

git clone [URL_DEL_REPOSITORIO]
Reemplaza [URL_DEL_REPOSITORIO] con la URL real de tu repositorio de GitHub, GitLab, etc.

Navegar al Directorio del Proyecto:

Bash

cd nombre-del-repositorio
Asegúrate de cambiar nombre-del-repositorio por el nombre real de la carpeta que se creó al clonar.

Abrir en Remix IDE:
Como el contrato está diseñado para Remix, la forma más sencilla de trabajar con él es:

Ve a Remix Ethereum IDE.
En la barra lateral izquierda, haz clic en el icono de la carpeta (File Explorers).
Haz clic en el botón + para crear un nuevo archivo y pega el código de tu contrato. Alternativamente, puedes cargar el archivo .sol si lo tienes descargado localmente.
Compila el contrato en la pestaña "Solidity Compiler" y despliégalo en la pestaña "Deploy & Run Transactions".
📄 Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

🆘 ¿Necesitas Ayuda? Guía de Depuración (RemixAI)
¡Hola! Soy RemixAI, tu asistente de IA para Web3. Si estás trabajando con este contrato (o cualquier otro código Solidity) y encuentras problemas, aquí tienes una guía general de depuración.

🚩 Errores Comunes y Sus Soluciones
Errores de Tipografía o Sintaxis: Revisa cuidadosamente cada nombre de variable, llamada a función y operador. Un simple error tipográfico puede romper todo.
Incompatibilidad de Tipos: Asegúrate de que los tipos de datos coincidan (ej. uint256 cuando esperas un número, address para una dirección).
Importaciones Faltantes: Si usas bibliotecas externas, verifica que todas estén importadas correctamente al inicio de tu contrato.
🔍 Proceso de Depuración Paso a Paso
Analiza el Mensaje de Error: El mensaje de error (especialmente en Remix o la consola de la terminal) es tu pista más importante. Contiene detalles específicos sobre qué salió mal y dónde.
Revisión de Código Línea por Línea: Examina el código en el área que el mensaje de error señala. Presta especial atención a la lógica en esa sección.
Usa el Depurador de Remix: La suite de Remix incluye un depurador potente. Ejecuta tu transacción en modo de depuración para avanzar paso a paso por tu código e identificar exactamente dónde se produce el error o el comportamiento inesperado.
Ejemplo de Corrección (Ilustrativo)
Imagina un error en la línea 139 que podría ser similar a esto:

Solidity

// Código Original (¡NO USAR! Es solo un ejemplo de error):
uint256 public balance = owner.transfer(10 ether); // Error: transfer es una función, no un valor asignable directamente.

// Código Corregido (cómo podría ser una solución):
uint256 public balance;
// Para obtener el balance del propietario, haríamos algo como:
balance = address(owner).balance; // Asumiendo 'owner' es una variable de tipo address.
Si aún no logras resolver el problema, no dudes en compartir más detalles sobre tu código o el contexto del error.
