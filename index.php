<?php
// Usar excepciones en lugar de errores.
function exception_error_handler($no_err, $desc_err, $archivo_err, $linea_err ) {
	throw new ErrorException($desc_err, 0, $no_err, $archivo_err, $linea_err);
}
set_error_handler("exception_error_handler");

// Configuración
/*
 * TODO
 * Pendiente hacer alguna rutina de importacion que valide que las cosas que se están importando
 * en la configuración son válidas
 */
//require_once 'kuentasKlaras.ini';

// Conexión con BD
// TODO Esto debería venir en la configuracion
$db = new pdo(
	'sqlite:/var/www/phpliteadmin/kuentasKlaras',
	null,
	null,
	array(PDO::ATTR_PERSISTENT => true)
);

// Verifica sesión
/*
 * TODO
 * Hacer un archivo que valide que haya una sesión válida
 * Evidentemente si queremos que haya _alguna_ forma de autenticarse hay que pensar en la
 * implementación, que normalmente significa SSL.
 * ¿En la base de datos se guardan los pass?
 *
 * También considerar que diferentes usuarios tienen diferentes cuentas, si todo se guarda en la
 * misma base entonces hay que modificar la estructura de la base para que distinga cuentas entre
 * usuarios.
 */



?>