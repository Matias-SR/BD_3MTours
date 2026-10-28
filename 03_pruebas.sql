
-- prueba 1: los cupos de tour 2 bajaron de 10 a 8
--BEGIN pkg_reservas.sp_registrar_reserva(13, 2, 2); 
--END;
--/
-- prueba 2: ORA-20001 Cupos insuficientes y registr+p nada 
--BEGIN pkg_reservas.sp_registrar_reserva(13, 2, 9999); 
--END;
--/
-- prueba 3: se guardó a la pax camila perez junto a su correo electronico
--INSERT INTO usuarios (nombre, email, password_hash, id_rol, estado, fecha_registro)
-- VALUES ('  cAmIlA pEReZ ', ' CAMILA@MAIL.COM', 'hash7', 4, 'ACTIVO', SYSDATE);


 --COMMIT;

--SELECT id_usuario, nombre, email FROM usuarios ORDER BY id_usuario DESC;


--SELECT cupos_disponibles FROM tours WHERE id_tour = 2;

--SELECT id_reserva, id_usuario, id_tour, cantidad_personas, monto_total, estado_reserva
  --FROM reservas ORDER BY id_reserva DESC;

-- prueba 4: PLS-00302, demuestra que fn_calcular_total es privada
--BEGIN
  --DBMS_OUTPUT.PUT_LINE( pkg_reservas.fn_calcular_total(35000, 2) );
--END;
--/

--prueba 5 ejecutada, mostró "Total de reservas registradas: 69"


--SET SERVEROUTPUT ON;
--BEGIN pkg_reservas.sp_registrar_reserva(13, 14, 1); 
--END;
--/

SELECT cupos_disponibles FROM tours WHERE id_tour = 2;


-- prueba 6 (tarea en vivo): se agregó validación de estado al procedimiento.
-- Tour 1 (CANCELADO) -> ORA-20002: El tour no está activo

BEGIN pkg_reservas.sp_registrar_reserva(13, 1, 1); 
END;
/


-- prueba 7: fn_consultar_cupos desde sql
-- SELECT pkg_resercas.fn_consultar_cupos(14) FROM DUAL; DEBERIA DAR 18
-- SELECT pkg_resercas.fn_consultar_cupos(25) FROM DUAL; DA NULL

--SET SERVEROUTPUT ON;
--BEGIN
--  DBMS_OUTPUT.PUT_LINE( pkg_reservas.fn_consultar_cupos(25) );
--END;
--/
