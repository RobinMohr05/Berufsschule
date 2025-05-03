use nordwind;
#a
select versandfirmen.Firma, avg(datediff(bestellungen.lieferdatum, bestellungen.versanddatum)) as 'durchschnittlicher versand'
from versandfirmen join bestellungen on versandfirmen.FirmenNr = bestellungen.FirmenNr 
group by versandfirmen.FirmenNr;
#b
select versandfirmen.Firma, sum(bestellungen.Frachtkosten)
from versandfirmen join bestellungen on versandfirmen.FirmenNr = bestellungen.FirmenNr 
where year(bestellungen.Bestelldatum) = 1996
group by versandfirmen.FirmenNr;
#c
select distinct kunden.kontaktperson 
from kunden join bestellungen on bestellungen.KundenCode = kunden.KundenCode
where bestellungen.Bestelldatum is not null and bestellungen.Versanddatum is null;
#d
select kunden.kontaktperson, count(*)
from kunden left join bestellungen on kunden.KundenCode = bestellungen.KundenCode
where year(bestellungen.Bestelldatum) = 1998
group by kunden.KundenCode;
#e
select bestellungen.BestellNr, sum(bestelldetails.anzahl * bestelldetails.Einzelpreis * (1-bestelldetails.rabatt))as bestellwert, bestellungen.Bestelldatum
from bestellungen join kunden on kunden.KundenCode = bestellungen.KundenCode join bestelldetails on bestelldetails.BestellNr = bestellungen.BestellNr
where kunden.KundenCode = 'LILAS' and year(bestelldatum) = 1996 group by bestellungen.BestellNr having bestellwert > 1000;

#f
select count(*) as 'Lieferungen in USA' from bestellungen where Bestimmungsland = 'USA';
#g
select count(distinct(Bestimmungsland)) as 'distinct länder'from bestellungen;
#h
select sum(bestelldetails.anzahl * bestelldetails.Einzelpreis * (1-bestelldetails.rabatt)) 
from lieferanten 
join artikel on Lieferanten.LieferantenNr = artikel.LieferantenNr 
join bestelldetails on bestelldetails.artikelNr = artikel.artikelNr 
join bestellungen on bestellungen.BestellNr = bestelldetails.BestellNr 
where Land in ('Schweden','Finnland','Norwegen');
#i
select * from lieferanten;
select distinct *
from kunden 
join bestellungen on bestellungen.KundenCode = kunden.KundenCode 
join versandfirmen on versandfirmen.FirmenNr = bestellungen.FirmenNr
where year(bestellungen.bestelldatum) = 1996
and datediff(bestellungen.lieferdatum, bestellungen.versanddatum) > 30 
and versandfirmen.Firma like 'Speedy Express' 
group by bestellungen.KundenCode
#j