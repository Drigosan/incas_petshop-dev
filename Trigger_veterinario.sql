/* O PetShop não pode ter mais que 4 veterinários */

CREATE OR REPLACE FUNCTION tf_veterinario()
RETURNS trigger AS $$
DECLARE
  v_count int;
BEGIN

  FOR v_count IN ( SELECT COUNT(*)
                   FROM veterinario
                 )
  LOOP
    IF v_count > 4 THEN
      RAISE EXCEPTION 'Número de veterinários maior que 4';
    END IF;  
  END LOOP;
  
  RETURN NEW;
  
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER tg_veterinario
AFTER UPDATE OR INSERT
ON veterinario
FOR EACH STATEMENT
EXECUTE PROCEDURE tf_veterinario();