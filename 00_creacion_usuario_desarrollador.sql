-- Habilita la creación de usuarios en Oracle 12c/19c/21c/23c
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Crear el usuario
CREATE USER usuario_3MTours IDENTIFIED BY "123456"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- Asignar cuota y permisos básicos
ALTER USER usuario_3MTours QUOTA UNLIMITED ON USERS;
GRANT CREATE SESSION TO usuario_3MTours;
GRANT "RESOURCE" TO usuario_3MTours;
ALTER USER usuario_3MTours DEFAULT ROLE "RESOURCE";