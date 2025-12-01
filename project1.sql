--------- DOR PESSO FIRST PROJECT-----
-----------FAMOUS FOOTBALL PLAYERS----

---THIS DATA BASE STORES SOME OF THE BEST PLAYERS IN THE WORLD ----
----SPLITS INTO TWO MAIN SECTIONS:
---'THE PLAYERS'-stores basic information regarding to the players
---'the last season stat'-stores all the main stats(appearences,goals,assists) regarding to the players


------create database Best_Players
------go 
------use Best_Players
------go
------create table spain(
------playerid int primary key,
------firstname nvarchar(20) ,
------lastname nvarchar(20) ,
------Team nvarchar(30),
------Position nvarchar(20)

----insert into spain values(1,'Dani','Olmo','Barcelona','Midfielder'),
----(2,'Lamine','Yamal','Barcelona','Forward'),
----(3,'Mikel','Merino','Arsenal','Midfielder'),
----(4,'Dani','Carvajal','Real Madrid','Defender'),
----(5,'David','Raya','Arsenal','Goalkeeper')



------create table germany(
------playerid int primary key,
------firstname nvarchar(20) ,
------lastname nvarchar(20),
------Team nvarchar(30),
------Position nvarchar(20)
------)

----insert into germany values(1,'Florian','Wirtz','Liverpool','Midfielder'),
----(2,'Jamal','Musiala','Bayern Munich','Midfielder'),
----(3,'Ilkay','Gundugan','Barcelona','Midfielder'),
----(4,'Antonio','Rudiger','Real Madrid','Defender'),
----(5,'Manuel','Neuer','Bayern Munich','Goalkeeper')



------create table Israel(
------playerid int primary key,
------firstname nvarchar(20) ,
------lastname nvarchar(20),
------Team nvarchar(30),
------Position nvarchar(20)
------)

----insert into israel values(1,'Manor','Solomon','Villareal','Midfielder'),
----(2,'Shon','Weismann','Blau Weiss Linz','Forward'),
----(3,'Oscar','Gloukh','Ajax','Midfielder'),
----(4,'Stav','Lemkin','Twente','Defender'),
----(5,'Daniel','Peretz','Hamburg','Goalkeeper')


------create table Italy(
------playerid int primary key,
------firstname nvarchar(20) ,
------lastname nvarchar(20),
------Team nvarchar(30),
------Position nvarchar(20)
------)
----insert into italy values(1,'Gianluigi','Olmo','Barcelona','Midfielder'),
----(2,'Moise','Kean','Juventus','Forward'),
----(3,'Sandro','Tonali','Newcastle','Midfielder'),
----(4,'alessandro','Bastoni','Inter','Defender'),
----(5,'Gianluigi','Donnarumma','Manchester City','Goalkeeper')

--update italy set lastname='Barella',firstname='Nicolo'
--where playerid=1


------create table England(
------playerid int primary key,
------firstname nvarchar(20) ,
------lastname nvarchar(20),
------Team nvarchar(30),
------Position nvarchar(20)
------)

----insert into England values(1,'Jude','Bellingham','Real Madrid','Midfielder'),
----(2,'Harry','Kane','Bayern Munich','Forward'),
----(3,'Bukayo','Saka','Arsenal','Forward'),
----(4,'Phil','Foden','Manchester City','Midfielder'),
----(5,'Declan','Rice','Arsenal','Midfielder')


----create schema lastseason

----create table lastseason.spain(
----Playerid int identity(1,1),
----team nvarchar(30) not null,
----Apearancess int,
----Goals int,
----assist int,
----primary key(playerid)
----)

--insert into lastseason.spain (team,apearancess,goals,assist)
--values('Barcelona',47,12,7),
--('Barcelona',60,19,22),
--('Arsenal',51,11,7),
--('Real Madrid',13,1,1),
--('Arsenal',60,null,null)




----create table lastseason.italy(
----Playerid int identity(1,1),
----team nvarchar(30) not null,
----Apearancess int,
----Goals int,
----assist int,
----primary key(playerid)
----)


--insert into lastseason.italy (team,apearancess,goals,assist)
--values('Barcelona',40,15,6),
--('Juventus',34,12,7),
--('Newcastle',41,11,14),
--('Inter',38,2,1),
--('Manchester City',62,null,null)


----create table lastseason.israel(
----Playerid int identity(1,1),
----team nvarchar(30) not null,
----Apearancess int,
----Goals int,
----assist int,
----primary key(playerid)
----)


--insert into lastseason.israel (team,apearancess,goals,assist)
--values('Villareal',47,12,7),
--('Blau Weiss Linz',37,15,7),
--('Ajax',43,12,6),
--('Twente',32,null,1),
--('Hamburg',8,null,null)


----create table lastseason.Germany(
----Playerid int identity(1,1),
----team nvarchar(30) not null,
----Apearancess int,
----Goals int,
----assist int,
----primary key(playerid)
----)


--insert into lastseason.Germany (team,apearancess,goals,assist)
--values('Liverpool',58,22,20),
--('Bayern Munich',50,24,11),
--('Barcelona',51,11,7),
--('Real Madrid',55,4,1),
--('Bayern Munich',42,null,null)

----create table lastseason.England(
----Playerid int identity(1,1),
----team nvarchar(30) not null,
----Apearancess int,
----Goals int,
----assist int,
----primary key(playerid)
----)


--insert into lastseason.England (team,apearancess,goals,assist)
--values('Real Madrid',69,17,14),
--('Bayern Munich',58,43,22),
--('Arsenal',39,13,12),
--('Manchester city',50,12,4),
--('Arsenal',47,11,11)

--alter table lastseason.israel add foreign key(playerid) references israel
--alter table lastseason.england add foreign key(playerid) references england
--alter table lastseason.italy add  foreign key(playerid) references italy
--alter table lastseason.germany add foreign key(playerid) references germany
