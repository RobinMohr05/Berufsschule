use kosidasdb;
#a
select avg(gehalt) from mitarbeiter where plzid = 6;
#b
select avg(gehalt), plzid from mitarbeiter group by plzid;
#c
select count(geschlecht),geschlecht, plzid from mitarbeiter group by plzid, geschlecht;
#d
select avg(preis), min(preis), max(preis), kategorieId from artikel group by kategorieid;
#e
select count(*), kategorieid from artikel group by kategorieid having count(*) > 5;
#f
select count(*), kategorieid from artikel where preis > 50 group by kategorieid;
#g
select count(*), kategorieid from artikel where preis > 50 group by kategorieid having count(*) > 2;
#h
select avg(gehalt), plzid from mitarbeiter group by plzid having count(*) >= 2;
#i
select avg(preis) as avg_preis, kategorieid from artikel group by kategorieid having avg_preis > 30.00;
#j
select count(DISTINCT artikelid), bestellid from posten group by bestellid;
#k
select Count(distinct farbid), kategorieid from artikel group by kategorieid order by count(distinct farbid) desc limit 1;
#l
select count(*), kategorieid from artikel group by kategorieid having sum(preis) < 600 and count(*) <20;
