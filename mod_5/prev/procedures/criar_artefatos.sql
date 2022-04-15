CREATE OR REPLACE FUNCTION 
	criar_artefatos()
RETURNS VOID AS $$

DECLARE 

  i INTEGER;

BEGIN

  -- Adição das mochilas do Jogo
  INSERT INTO Tipo_Mochila VALUES('basica', 20);
  INSERT INTO Tipo_Mochila VALUES('normal', 35);
  INSERT INTO Tipo_Mochila VALUES('reforcada', 50);

  -- Adição dos Níveis
  FOR i IN 1..30 LOOP
    INSERT INTO Nivel
      (Valor, Pontos_ao_Subir, Experiencia_para_Subir_de_Nivel)
    VALUES(i, random()*(1-10)+10, i * 100);
  END LOOP;
  
  -- Adição dos Barcos
  INSERT INTO Barco 
    (Tipo, Capacidade, Velocidade, Ataque, Defesa)
  VALUES ('knarr', 15, 10, 100, 80);
  INSERT INTO Barco VALUES ('langskip', 15, 10, 100, 80);

END;
$$ LANGUAGE plpgsql;