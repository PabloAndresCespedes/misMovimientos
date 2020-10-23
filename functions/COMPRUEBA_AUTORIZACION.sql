create or replace function "COMPRUEBA_AUTORIZACION"
(p_user in VARCHAR2,
p_pass in VARCHAR2)
return BOOLEAN
is
v_c NUMBER;
begin
    select distinct 1
    into v_c
    from USUARIOS 
    where ESTADO_ID = 1 -- ACTIVO
    AND   NICK = UPPER(p_user)
    AND   PASS = HASH_PASSWORD(p_user, p_pass)
    ;
    return TRUE;    
EXCEPTION
    WHEN others THEN
        return false;
end;
