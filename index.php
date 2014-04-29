<?php
// Usar excepciones en lugar de errores.
function exception_error_handler($no_err, $desc_err, $archivo_err, $linea_err ) {
	throw new ErrorException($desc_err, 0, $no_err, $archivo_err, $linea_err);
}
set_error_handler("exception_error_handler");

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
 *
 * Usuarios y bancos:
 * En la BD hay un catálogo de bancos, de entrada propondría que un banco se "comparte" entre los
 * diferentes usuarios, sin embargo si yo le llamo "mi_banco" a Santander y otro le llama diferente
 * con el alias de la cuenta suena a problemas. Considera quitar el "alias" de la tabla "cuentas".
 */
//require_once 'sesion.php';



?>