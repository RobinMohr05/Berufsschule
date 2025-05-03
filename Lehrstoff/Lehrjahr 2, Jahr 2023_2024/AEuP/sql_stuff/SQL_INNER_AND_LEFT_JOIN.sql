use kosidasdb;
select kunde.kundeid, kunde.vorname, kunde.nachname, kunde.strasse, kunde.nummer, ort.plz, ort.stadt
from kunde join ort on ort.plzid = kunde.plzid
where ort.stadt like '%Wu%';	


use kosidasdb;
select artikel.artikelid, artikel.bezeichnung, farbe.bezeichnung, sum(posten.anzahl) as Anzahl_Bestellung 
from artikel left join farbe on artikel.farbid = farbe.farbid 
left join posten on posten.artikelid = artikel.artikelid 
group by artikel.artikelid;