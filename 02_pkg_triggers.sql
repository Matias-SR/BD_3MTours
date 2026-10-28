
SELECT * FROM RESERVAS;

-- paquete  menú restaurant )muestra lo que hay (los platos)
CREATE OR REPLACE PACKAGE pkg_reservas
AS
  g_total_reservas NUMBER := 0;

  FUNCTION fn_consultar_cupos( p_id_tour IN NUMBER ) RETURN NUMBER;

  PROCEDURE
   sp_registrar_reserva( p_id_usuario IN NUMBER,
   p_id_tour IN NUMBER,
   p_cantidad IN NUMBER );
END pkg_reservas;
/


--cuerpo (la cocina del restaurant )
CREATE OR REPLACE PACKAGE BODY pkg_reservas
IS
  -- PRIVADA: no está en la especificación, solo se usa dentro del paquete
  FUNCTION fn_calcular_total( p_precio IN NUMBER, p_cantidad IN NUMBER ) RETURN NUMBER
  AS
  BEGIN
    RETURN p_precio * p_cantidad;
  END fn_calcular_total;

  FUNCTION fn_consultar_cupos( p_id_tour IN NUMBER ) RETURN NUMBER
  AS
    v_cupos NUMBER;
  BEGIN
    SELECT cupos_disponibles INTO v_cupos FROM tours WHERE id_tour = p_id_tour;
    RETURN v_cupos;
  END fn_consultar_cupos;

  PROCEDURE sp_registrar_reserva( p_id_usuario IN NUMBER,
    p_id_tour IN NUMBER,
    p_cantidad IN NUMBER )
  AS
    v_cupos  NUMBER;  --1 
    v_precio NUMBER; --3
    v_monto  NUMBER;  --4  
    v_estado VARCHAR2(20); --2
  BEGIN
    v_cupos := fn_consultar_cupos( p_id_tour );

    IF v_cupos < p_cantidad THEN -- si los cupos son menores a la cantidad entonces... error cupos insuficientes

      RAISE_APPLICATION_ERROR(-20001, 'Cupos insuficientes');
    END IF;

    SELECT precio, estado INTO v_precio, v_estado FROM tours WHERE id_tour = p_id_tour;
      IF v_estado != 'ACTIVO' then
        RAISE_APPLICATION_ERROR (-20002, ' El tour no está activo');
      END IF;

      v_monto := fn_calcular_total(v_precio, p_cantidad);  

      

    INSERT INTO reservas (id_usuario, id_tour, cantidad_personas,
      monto_total, estado_reserva, fecha_reserva)
    VALUES (p_id_usuario, p_id_tour, p_cantidad,
      v_monto, 'CONFIRMADA', SYSDATE);  

    UPDATE tours SET cupos_disponibles = cupos_disponibles - p_cantidad
     WHERE id_tour = p_id_tour;

    COMMIT;
    g_total_reservas := g_total_reservas + p_cantidad;
  END sp_registrar_reserva;
END pkg_reservas;
/

CREATE OR REPLACE TRIGGER tgr_validar_datos_usuario
BEFORE INSERT OR UPDATE ON usuarios
FOR EACH ROW
BEGIN
  :NEW.nombre := TRIM( INITCAP( :NEW.nombre ) );
  :NEW.email  := LOWER( REPLACE( :NEW.email, ' ', '' ) );
END tgr_validar_datos_usuario;
/

CREATE OR REPLACE TRIGGER tgr_resumen_reservas
AFTER INSERT ON reservas
DECLARE
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM reservas;
  DBMS_OUTPUT.PUT_LINE('Total de reservas registradas: ' || v_total);
END tgr_resumen_reservas;
/

SET SERVEROUTPUT ON;

SELECT object_name, object_type, status
  FROM user_objects
 WHERE object_name IN ('PKG_RESERVAS', 'TGR_VALIDAR_DATOS_USUARIO', 'TGR_RESUMEN_RESERVAS');



-- LOS ERRORES QUE ME APARECIERON 

-- error 1 PLS-00304: compilé el cuerpo antes que la especificación. La solución fue compilar primero la especificación y después el cuerpo.
--error 2 PLS-00103: bloques pegados sin / hicieron que me de un error, la solucion era poner / al final de cada floque 
--error 3 PLS00231: la IA propuso usar seq_reservas.NEXTVAL, pero la tabla usa IDENTITY. Lo revisé y no lo acepté, por eso el INSERT no lleva id.
---------- la solución calcular en v_monto y luego usar la variable en el insert.
--error 4 ORA-04068: al compilar el cuerpo. se reinicia el estado del paquete por lo que se tiene que volver a ejecutar
