Aqui simplemente quiero escribir todo el proceso para llevar a 
cabo esta web.

La idea de la web es la siguiente, utilizando JSP,SPA,Servlets,Clases Java
y una base de datos, crear una web donde podamos crear y almacenar
un monton de preguntas para luego crear un examen a partir de estas, teniendo
algunas variables de sesión de por medio, un login si quieres, correccion
de examenes, guardado de resultado de examenes en un txt...

 + Crear el "index.jsp" donde tendremos un log in en el cual diferenciamos
entre administrador y no administrador, solo el administrador podra
acceder a la creacion de preguntas y examenes, todos los demás
iran a hacer el examen. Guardaremos en variables de sesion hora de entrada
y nombre, enviaremos todo esto al servlet "SvUsuarios.java".

+ En el servlet "SvUsuarios.java" acabo de simular unos get y post muy simples, en el post
simplemente aprendo a tomar los parametros enviados y los imprimo en consola y luego,
en el get cree una "base de datos" lógica e imprimi por pantalla todos los datos de esta
usando una clase java llamada "Usuario.java" como intermediario para el contructor getter y setter.

 + Creo el paquete "persistencias" que es donde almacenare todas las configuraciones de base de datos
que voy a utilizar, aqui tengo toda la conexion, luego crear el primero controlador

 + Crea el "UsuarioJpaController" este controllador se encarga de manejar los CRUD
de la base de datos en las tablas de usuarios, y contacta con el controlador.
la clase "Controladora.java" de la carpeta de "lógica" es quien contacta con el JPAcontroller de usuarios
para manejar las consultas de sql

 + El servlet "SvUsuarios" toma los metodos de "Controladora" y ya tenemos una conexion
con base de datos usando JPA en lugar de consultas SQL y podemos eliminar la
pseudo base de datos creada de forma lógica, por tanto ahora la conexión es la siguiente:
Index->Servlet->Controladora->UsuarioJpaController->BaseDeDatos

 + Distinguir antes de introducir un usuario con el metodo post si este existe o no para
no tener alumnos repetidos aunque su id sea distinto, y diferencia si este es administrador o no
segun cual sea se le redirije a una pagina u otra

+ Editar la pagina de "creaciones.jsp" donde el usuario ñade sus preguntas, luego crear la clase de "preguntas.java", añadirlo a las persistencias, y crear su JPA, su controlador y su servlet. por tanto ya se almacenan preguntas de forma correcta

+ Ahora puedo mostrar la lista de preguntas al pulsar el boton, usando el mismo metodo usando para mostrar la lista de alumnos, ahora tengo que añadir un boton rojo para eliminar una pregunta

+ Añado el boton para mostrar el examen y ademas de eso en propio examen se puede corregir, el orden de las preguntas es aleatorio, y utilizo para todo esto dos servlets nuevos además de eso gran parte de la información se guarda de forma temporal de manera lógica, al igual que en el apartado de mostrar ususario y preguntas

+ Añadir el boton de correccion del examen donde para comproobarlo compruebo si el value puesto en cada radio corresponde
con el id que tiene asignado cada pregunta de manera unica

+ Opcion de descarga del examen, le doy a cada examen un id aleatorio unico para prevenir examenes con id repetidos
utilizando el formato de  mostrar respuestas AIKON

+ Corregir login de usuarios , ahora si pones un usuario y contraseña correcto comprueba que eres o no aadministrador,
para ver si puedes entrar, y si no coincide la contraseña manda un mensaje de error, no hay limite de intento (por ahora)

+ Empezar a meter estilos varios, bastante irrelevante para la documentación

+ Prevengo que me introduzcan un numero de preguntas mayor como examen a  las
que tenemos en la base de datos y mando un mensaje de error a mi usuario

+ Utilizando variables de sesion compruebo si el usuario ingresado tiene
el campo de admin, si no es asi, le impido que enntre a las paginas 
privadas de admin, ya solo me falta mejorar el mensaje de salida al 
descargar el examen

+ Correcciones simples de mostrar mejor el mensaje de descarga un par de estilos y listo, solo queda desplegar el 
proyecto, aun tiene algunos errores menores como que inserten texto en un campo que no deben o algo así
pero en general el proyecto esta muy bien, mucho mejor de lo que me esperaba
