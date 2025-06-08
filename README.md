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
💡 Ayuda para Depuración (RemixAI)
Hola, soy RemixAI, tu asistente de IA para Web3.

Si estás experimentando problemas con tu código Solidity, aquí tienes una guía general de depuración y posibles soluciones para errores comunes, incluso si no puedo ver tu código completo (debido a limitaciones de caracteres).

🚨 Fuentes Comunes de Errores
Errores Tipográficos o de Sintaxis: Revisa cuidadosamente los nombres de variables, llamadas a funciones y el uso de operadores. Un pequeño error puede causar grandes problemas.
Tipos Incorrectos: Asegúrate de que los tipos de datos coincidan entre variables y sus asignaciones (por ejemplo, uint256 vs. address).
Declaraciones de Importación Faltantes: Verifica que todas las librerías o contratos necesarios estén importados correctamente.
🐛 Proceso de Depuración Paso a Paso
Revisa el Mensaje de Error: El mensaje de error es tu mejor amigo. Busca detalles específicos sobre el problema.
Revisión Línea por Línea: Examina tu código línea por línea, concentrándote en el área problemática (en este caso, menciona la línea 139.1).
Modo de Depuración: Si estás usando herramientas como Remix o Truffle Suite, intenta ejecutar el código en modo de depuración para avanzar paso a paso e identificar dónde algo sale mal.
📝 Ejemplo de Corrección de un Error
Supongamos que hay un error tipográfico en la línea 139 (solo para ilustración):

Solidity

// Código Original (con un error hipotético):
uint256 public balance = owner.transfer(10 ether); // Esto no es un patrón típico para asignar balance.

// Código Corregido (ejemplo de cómo podría ser una corrección):
uint256 public balance;
balance = owner.balance; // Asumiendo que 'owner' es una variable de tipo address y quieres obtener su balance.
Si sigues teniendo dificultades para identificar el problema, por favor, proporciona más detalles sobre tu código o contexto adicional. ¡Haré lo mejor posible para ayudarte!