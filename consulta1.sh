#!/bin/bash
/usr/pgsql-9.4/bin/psql postgresql://readonly:readonly2k22@127.0.0.1/ecommerceprod << EOF
SELECT cedula, nombre, apellido, estado, email, codigo_vendedor, fecha_ingreso 
 FROM sch_administracion.usuario FULL OUTER JOIN sch_administracion.usuario_ingreso 
 ON usuario.id_usuario=usuario_ingreso.id_usuario;
EOF
