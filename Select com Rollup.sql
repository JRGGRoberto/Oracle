select 
   case
    when (a.nomeorgaoaverb is null) then 'Total'
      else a.nomeorgaoaverb
   end as averbadora,
 
  case
    when (po.descricao is null and a.nomeorgaoaverb is null) then ''
    when (po.descricao is null) then 'Subtotal >'
      else po.descricao
  end as Tipo,
  sum(mva.vlpgto)
from 
   participante p
      left join dadospagador d on p.idparticipante = d.idpagador
      left join averbadora a on a.idaverbadora = d.idaverbadora
      left join pagproposta pg on pg.iddadospagador = d.iddadospagador
      left join proposta pr on pr.idproposta = pg.idproposta
      left join propcobert pc on pc.idproposta = pg.idproposta
      left join produto po on po.idproduto = pc.idproduto
      left join cobertura co on co.idcobertura = pc.idpropcobert
      inner join movcontrib_atual mva on mva.idpropcobert = pc.idpropcobert
where p.nome like 'JOSE' 
GROUP BY ROLLUP(a.nomeorgaoaverb, po.descricao);
