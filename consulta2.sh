#!/bin/bash
/usr/pgsql-9.4/bin/psql postgresql://readonly:readonly2k22@127.0.0.1/ecommerceprod << EOF
SELECT cedula, b.nombre, apellido, direccion, telefono, login, email, b.estado, ver_reporte as ListadoF, ver_reporte_ac as ListadoAC, b.codigo_vendedor, c.nombre, c.codigo 
FROM sch_administracion.precio_vendedor as a FULL OUTER JOIN sch_administracion.usuario as b 
ON a.id_usuario=b.id_usuario  
FULL OUTER JOIN sch_parametro.catalogo as c 
ON a.id_catalogo_precio=c.id_catalogo;
EOF
