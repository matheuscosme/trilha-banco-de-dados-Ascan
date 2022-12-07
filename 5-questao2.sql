select p.listing_id, 
min(p.old_price) as Preco_Minimo, 
max(p.new_price) as Preco_Maximo,
b.built_area as Area, 
min(p.old_price)/b.built_area as MinPrecoPorM2, 
max(p.new_price)/b.built_area as MaxPrecoPorM2,
(((max(p.new_price)/b.built_area)/(min(p.old_price)/b.built_area)) - 1) * 100 as Percentual
from price_changes p join built_used_area b 
on (p.listing_id = b.listing_id)
where year(p.change_date) = 2016
and p.new_price > p.old_price
and p.old_price <> 0
group by p.listing_id
order by percentual desc;


select listing_id, max(old_price), min(new_price),((max(old_price)/min(new_price) - 1)*100) as percentual
from price_changes
where year(change_date) = 2016
and new_price < old_price
and new_price <> 0
group by listing_id
order by percentual desc;




    
    
#Aumento
select p.listing_id, 
min(p.old_price) as Preco_Minimo, 
max(p.new_price) as Preco_Maximo,
b.built_area as Area, 
min(p.old_price)/b.built_area as MinPrecoPorM2, 
max(p.new_price)/b.built_area as MaxPrecoPorM2,
(((max(p.new_price)/b.built_area)/(min(p.old_price)/b.built_area)) - 1) * 100 
as Percentual
from price_changes p join built_used_area b 
on (p.listing_id = b.listing_id)
where year(p.change_date) = 2016
and p.new_price > p.old_price
and p.old_price <> 0
and b.built_area <> 0
group by p.listing_id;



#Decrescimo
select p.listing_id, 
max(p.old_price) as Preco_Max_Old, 
min(p.new_price) as Preco_Min_New,
b.built_area as Area, 
max(p.old_price)/b.built_area as MaxPrecoPorM2_Old, 
min(p.new_price)/b.built_area as MinPrecoPorM2_New,
(1 - ((min(p.new_price)/b.built_area)/(max(p.old_price)/b.built_area)) ) * 100 as Percentual
from price_changes p join built_used_area b 
on (p.listing_id = b.listing_id)
where year(p.change_date) = 2016
and p.new_price < p.old_price
and p.new_price <> 0
and b.built_area <> 0
group by p.listing_id;




#Select 1
select count(*) as Num_Aumento, avg(percentual) as Media_Percentual 
from (
	select p.listing_id, 
	min(p.old_price) as Preco_Minimo, 
	max(p.new_price) as Preco_Maximo,
	b.built_area as Area, 
	min(p.old_price)/b.built_area as MinPrecoPorM2, 
	max(p.new_price)/b.built_area as MaxPrecoPorM2,
	(((max(p.new_price)/b.built_area)/(min(p.old_price)/b.built_area)) - 1) * 100 
    as Percentual
	from price_changes p join built_used_area b 
	on (p.listing_id = b.listing_id)
	where year(p.change_date) = 2016
	and p.new_price > p.old_price
	and p.old_price <> 0
    and b.built_area <> 0
	group by p.listing_id) as tabela;


#Select 2
select count(*) as Num_Decrescimo, avg(percentual) as Media_Percentual 
from (
	select p.listing_id, 
	max(p.old_price) as Preco_Max_Old, 
	min(p.new_price) as Preco_Min_New,
	b.built_area as Area, 
	max(p.old_price)/b.built_area as MaxPrecoPorM2_Old, 
	min(p.new_price)/b.built_area as MinPrecoPorM2_New,
	(1 - ((min(p.new_price)/b.built_area)/(max(p.old_price)/b.built_area)) ) * 100 
    as Percentual
	from price_changes p join built_used_area b 
	on (p.listing_id = b.listing_id)
	where year(p.change_date) = 2016
	and p.new_price < p.old_price
	and p.new_price <> 0
	and b.built_area <> 0
	group by p.listing_id) as tabela;

    


