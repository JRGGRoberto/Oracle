create table TMPJRGG
(
  idteste number,
  nome    varchar2(10),
  descri  varchar2(20)
)
tablespace TBS_CM_DADOS_01
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TMPJRGG
  is 'temporaria JRGG';
-- Add comments to the columns 
comment on column TMPJRGG.idteste
  is 'campo chave';
comment on column TMPJRGG.nome
  is 'nome valor';
comment on column TMPJRGG.descri
  is 'descrica';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TMPJRGG
  add constraint pkteste primary key (IDTESTE);
