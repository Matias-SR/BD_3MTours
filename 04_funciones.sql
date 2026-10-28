
-- =====================================================================

-- funcion SIN parametros = sin parentesis (ni al crearla ni al llamarla)
CREATE OR REPLACE FUNCTION fn_total_tours_activos
RETURN NUMBER
AS
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total FROM tours WHERE estado = 'ACTIVO';
  RETURN v_total;
END fn_total_tours_activos;
/

SET SERVEROUTPUT ON;

SELECT object_name, object_type, status
  FROM user_objects
 WHERE object_name = 'FN_TOTAL_TOURS_ACTIVOS';
