USE luna;

#a
INSERT INTO tblabteilung values("a4", "IT", "Würzburg");
#b
INSERT INTO tblabteilung (A_Nr,A_Name)
values("a5", "Marketing");
#c
UPDATE tblabteilung SET a_stadt = "Schweinfurt" WHERE a_nr = "a5";
#d
DELETE FROM tblabteilung WHERE a_nr = "a4";
#e
ALTER TABLE tblabteilung
ADD Motivationsspruch TEXT NOT NULL
DEFAULT "You are the best!";
#update tblabteilung
#set Motivationsspruch = "You are the best"
#where A_Nr > -1;

#f
ALTER TABLE tblabteilung
DROP Motivationsspruch;