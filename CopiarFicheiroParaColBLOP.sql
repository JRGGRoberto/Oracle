--Criar a tabela que receberá a imagem
create table TJR_IMG_ASS(
   NU_IMG_ASS    NUMBER,
   IM_IMG        BLOB
);

--Criar sequence para a chave - no insert usarei o nextval -- INSERT INTO TJR_IMG_ASS (NU_IMG_ASS, IM_IMG) VALUES (TJR_IND_IMG.nextval, EMPTY_BLOB())
CREATE SEQUENCE TJR_IND_IMG  START WITH 1 INCREMENT BY 1  CACHE 100;


-- Create directory 
create or replace directory ARQUIVOS
  as 'x:\oracle\arquivos';

-- copiar a imagem para  x:\oracle\arquivos 
-- executar o script abaixo
-- este script em comando, este irá copiar a imagem do DIRECTORY para a base da dados
DECLARE
L_BLOB BLOB;
L_BFILE BFILE;
BEGIN
INSERT INTO TJR_IMG_ASS (NU_IMG_ASS, IM_IMG)
VALUES (TJR_IND_IMG.nextval, EMPTY_BLOB())
RETURN IM_IMG INTO L_BLOB;
L_BFILE := BFILENAME('ARQUIVOS','image.jpg');
DBMS_LOB.FILEOPEN(L_BFILE);
DBMS_LOB.loadfromfile(L_BLOB,L_BFILE,DBMS_LOB.GETLENGTH(L_BFILE));
DBMS_LOB.fileclose(L_BFILE);
COMMIT;
END;
/
