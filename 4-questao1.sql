select p.listing_id, p.old_price, p.new_price, 
p.change_date, b.built_area,
b.used_area, (new_price/built_area) as ValorPorM2
from price_changes p
join built_used_area b 
on (p.listing_id = b.listing_id)
where year(p.change_date) = 2016 
and p.new_price > old_price 
and (b.built_area >200 or b.used_area >200)
and b.built_area <> 0
and b.used_area <> 0
order by (new_price/built_area);


SELECT p.listing_id, max(p.new_price), 
b.built_area, b.used_area,
(p.new_price/b.built_area) as ValorPorM2, 
count(*) as NumDeOcorrencias
from price_changes p
join built_used_area b
on (p.listing_id = b.listing_id)
where year(change_date) = 2016
and new_price > old_price
and (b.built_area > 200 or b.used_area > 200)
and b.built_area > 0
and b.used_area > 0
GROUP BY p.listing_id
order by NumDeOcorrencias desc;


#RESOLUÇÃO
SELECT avg(ValorPorM2) as 'Preço Médio/m²' from (
	SELECT p.listing_id, max(p.new_price), 
    b.built_area, b.used_area,
	(p.new_price/b.built_area) as ValorPorM2
	from price_changes p
	join built_used_area b
	on (p.listing_id = b.listing_id)
	where year(change_date) = 2016
	and new_price > old_price
	and (b.built_area > 200 or b.used_area > 200)
	and b.built_area > 0
	and b.used_area > 0
	GROUP BY p.listing_id) as tabela;




