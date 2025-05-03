use unternehmensdb;
#2 a
select * from artikel order by KATEGORIE, BEZEICHNUNG;
#b
select * from mitarbeiter order by GEHALT DESC, ABTEILUNG ASC;
#c
select * from artikel where KATEGORIE = 4 order by NETTOPREIS desc;
#d
select * from Kunde where ZAHLUNGSART like "N" group by PLZ;

#3 a
select avg(GEHALT) from mitarbeiter;
#b
select max(BESTELLMENGE) from posten;
#c
SELECT MIN(NAME) from kunde;
#d
select HERSTELLER, count(*) from artikel group by HERSTELLER order by count(*) desc LIMIT 2;

#4 a
select avg(gehalt), abteilung from mitarbeiter group by abteilung;
#b
select avg(BESTELLMENGE), artikelnr from posten group by artikelnr;
#c
select ort, count(*) from kunde group by ort order by count(*) desc;
#d
select ort, count(*) from kunde group by ort order by count(*) desc, ort asc;
#e
select count(*), kategorie from artikel where NETTOPREIS > 50 group by kategorie;
#f
select * from posten where bestellmenge > 4 order by bestellmenge desc;
#g
select count(*), Hersteller from artikel group by hersteller;
