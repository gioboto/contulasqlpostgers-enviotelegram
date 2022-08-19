#!/bin/bash
/usr/pgsql-9.4/bin/psql postgresql://readonly:readonly2k22@127.0.0.1/ecommerceprod << EOF
SELECT cedula, b.nombre, apellido, b.direccion, b.telefono, login, email, b.estado, ver_reporte as ListadoF, ver_reporte_ac as ListadoAC, b.codigo_vendedor, c.nombre, c.codigo, d.nombre 
FROM sch_administracion.precio_vendedor as a  
FULL OUTER JOIN sch_administracion.usuario as b 
ON a.id_usuario=b.id_usuario  
INNER JOIN sch_parametro.catalogo as c 
ON a.id_catalogo_precio=c.id_catalogo INNER JOIN sch_administracion.establecimiento AS d 
ON b.id_establecimiento=d.id_establecimiento;
EOF
