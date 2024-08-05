SELECT count(distinct sylvera_id), count(sylvera_id), 'project'
from public.projects 
union
SELECT count(distinct sylvera_id), count(sylvera_id), 'pricing'
from public.pricing
union
SELECT count(distinct sylvera_id), count(sylvera_id), 'ratings'
from public.ratings;




SELECT *
, (SELECT high_float FROM public.pricing as p WHERE pro.sylvera_id = p.sylvera_id  order by priced_at desc, high_float desc limit 1)
from public.projects as pro
left join public.ratings
    ON pro.sylvera_id = ratings.sylvera_id
ORDER BY pro.sylvera_id desc







select p.*
from (select p.*,
             row_number() over (partition by sylvera_id, vintage, priced_at order by high_float desc) as seq
      from public.pricing as p
    where 1 = 1
        and sylvera_id = 'SYL1581103'
        and vintage = '2012'
        

     ) p 
where seq = 1
order by priced_at desc
;

