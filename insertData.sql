## dni_tygodnia

INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Poniedziałek');
INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Wtorek');
INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Środa');
INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Czwartek');
INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Piątek');
INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Sobota');
INSERT INTO `dzien_tygodnia` (`nazwa`) VALUES('Niedziela');

## wojewodztwa

insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('POM', 'Pomorskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('ZPO', 'Zachodnio-Pomorskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('WMA', 'Warmińsko-Mazurskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('POD', 'Podlaskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('MAZ', 'Mazowieckie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('KPO', 'Kujawsko-Pomorskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('WIE', 'Wielkopolskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('LUL', 'Lubelskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('DOL', 'Dolnośląskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('OPO', 'Opolskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('SLO', 'Śląskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('MAL', 'Małopolskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('POK', 'Podkarpackie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('SWI', 'Świętokrzyskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('LUB', 'Lubuskie');
insert into `wojewodztwa`(`kod_woj`, `nazwa`) values('LOD', 'Łódzkie');

## miasta

INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Siedlce','MAZ');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Mińsk Mazowiecki','MAZ');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Warszawa','MAZ');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Skierniewice','LOD');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Łódź','LOD');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Bełchatów','LOD');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Szczecin','ZPO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Kołobrzeg','ZPO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Zielona góra','LUB');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Gdańsk','POM');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Gdynia','POM');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Sopot','POM');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Ełk','WMA');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Giżycko','WMA');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Mikołajki','WMA');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Białystok','POD');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Suwałki','POD');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Augustów','POD');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Sandomierz','SWI');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Lublin','LUL');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Rzeszów','POK');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Kraków','MAL');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Tarnów','MAL');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Katowice','SLO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Bytom','SLO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Sosnowiec','SLO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Poznań','WIE');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Piła','WIE');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Opole','OPO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Wrocław','DOL');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Wałbrzych','DOL');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Bydgoszcz','KPO');
INSERT INTO `miasta` (`nazwa`,`kod_woj`) VALUES('Toruń','KPO');

## uzytkownicy

insert into `uzytkownicy`(`login`, `haslo`, `email`) values('Tarti', '123456', 'tarti12@wp.pl');
insert into `uzytkownicy`(`login`, `haslo`, `email`) values('Marti', 'abcdefg', 'marti21@onet.pl');
insert into `uzytkownicy`(`login`, `haslo`, `email`) values('Peterson', 'qwerty', 'palewlosy@gmail.com');
insert into `uzytkownicy`(`login`, `haslo`, `email`) values('Smiechu22', 'niemamhasla00', 'smiesznysmiech@gmail.com');
insert into `uzytkownicy`(`login`, `haslo`, `email`) values('MarlenkaDuzeD', 'cyckicycki', 'marlenka19@buziaczek.pl');

## adres uzytkownika

INSERT INTO `adres uzytkownika` (`id_uzytkownika`,`id_miasta`,`ulica`,`nr_mieszkania`) VALUES(1,1,'Płaska', 'A3/22');
INSERT INTO `adres uzytkownika` (`id_uzytkownika`,`id_miasta`,`ulica`,`nr_mieszkania`) VALUES(2,1,'Wąska', '57');
INSERT INTO `adres uzytkownika` (`id_uzytkownika`,`id_miasta`,`ulica`,`nr_mieszkania`) VALUES(3,1,'Duża', 'B/11');
INSERT INTO `adres uzytkownika` (`id_uzytkownika`,`id_miasta`,`ulica`,`nr_mieszkania`) VALUES(4,1,'Długa', '7/23');
INSERT INTO `adres uzytkownika` (`id_uzytkownika`,`id_miasta`,`ulica`,`nr_mieszkania`) VALUES(5,1,'Zielona', '9');

## parite miesni

INSERT INTO `partia miesni` (`nazwa`) values('Barki');
INSERT INTO `partia miesni` (`nazwa`) values('Klata');
INSERT INTO `partia miesni` (`nazwa`) values('Biceps');
INSERT INTO `partia miesni` (`nazwa`) values('Triceps');
INSERT INTO `partia miesni` (`nazwa`) values('Plecy');
INSERT INTO `partia miesni` (`nazwa`) values('Brzuch');
INSERT INTO `partia miesni` (`nazwa`) values('Nogi');

## rodzaje diet

INSERT INTO `rodzaje diet` (`nazwa`) values('Białkowa');
INSERT INTO `rodzaje diet` (`nazwa`) values('Węglowodanowa');
INSERT INTO `rodzaje diet` (`nazwa`) values('Tłuszczowa');

## producenci

INSERT INTO `producent` (`nazwa`) values('Danone');
INSERT INTO `producent` (`nazwa`) values('Zoot');
INSERT INTO `producent` (`nazwa`) values('Wedel');
INSERT INTO `producent` (`nazwa`) values('Milka');
INSERT INTO `producent` (`nazwa`) values('Coca-Cola');
INSERT INTO `producent` (`nazwa`) values('Pepsi');
INSERT INTO `producent` (`nazwa`) values('Henryk Kania');
INSERT INTO `producent` (`nazwa`) values('Tarczyński');
INSERT INTO `producent` (`nazwa`) values('Morliny');
INSERT INTO `producent` (`nazwa`) values('Sokołów');
INSERT INTO `producent` (`nazwa`) values('Lays');
INSERT INTO `producent` (`nazwa`) values('Crunchips');
INSERT INTO `producent` (`nazwa`) values('Bakoma');

## produkty

INSERT INTO `produkty` (`nazwa`, `weglowodany`, `bialka`, `tluszcze`, `ilosc_kalorii`, `id_producenta`)	values('kabanosy drobiowe', 0, 20, 29, 378, 10);
INSERT INTO `produkty` (`nazwa`, `weglowodany`, `bialka`, `tluszcze`, `ilosc_kalorii`, `id_producenta`)	values('szynka konserwowa', 3, 13.5, 3, 93, 7);
INSERT INTO `produkty` (`nazwa`, `weglowodany`, `bialka`, `tluszcze`, `ilosc_kalorii`, `id_producenta`)	values('Cherry Coke', 10.6, 0, 0, 43, 4);
INSERT INTO `produkty` (`nazwa`, `weglowodany`, `bialka`, `tluszcze`, `ilosc_kalorii`, `id_producenta`)	values('Bakuś morelowy', 14, 6, 5, 125, 13);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Actimel Klasyczny',10.50,2.80,1.30,69,1);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Danio Extra z kawałkami toffi',17.30,5.40,5.10,138,1);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Baton Bajeczny',54.20,8.50,32.50,543,3);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Czekolada biała',56.70,6.30,34.70,564,3);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Boczek gotowany i wędzony',0.23,15.20,26.60,301,9);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Danie tatarskie',1,18.70,3.30,100,9);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Pepsi Twist',11.70,0,0,47,6);
INSERT INTO `produkty` (`nazwa`,`weglowodany`,`bialka`,`tluszcze`,`ilosc_kalorii`,`id_producenta`) VALUES('Chipsy Kiełbaska z cebulą',54,6,30,519,11);

## `cwiczenia`

#klatka
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`, `opis`) values('Klata ławka prosta', 2,'Kładziemy się na ławce prostej, chwytamy gryf prosty, przyciagamy do klatki piersiowej, a nastepnie wypychamy');
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`, `opis`) values('Klata skos dodatni', 2,'Kładziemy się na ławce skośnej(głowa ponad tłowiem), chwytamy gryf prosty, przyciagamy do klatki piersiowej, a nastepnie wypychamy');
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`, `opis`) values('Klata skos ujemny', 2, 'Kładziemy się na ławce skośnej(tłów wyżej niż głowa), chwytamy gryf prosty, przyciagamy do klatki piersiowej, a nastepnie wypychamy');
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`, `opis`) values('Klata ławka prosta(hantle)', 2,'Kładziemy się na ławce skośnej, chwytamy hantle, przyciagamy do klatki piersiowej, a nastepnie wypychamy');
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`, `opis`) values('Klata skos dodatni(hantle)', 2, 'Kładziemy się na ławce skośnej(głowa ponad tłowiem), chwytamy hantle, przyciagamy do klatki piersiowej, a nastepnie wypychamy');
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`, `opis`) values('Klata skos ujemny(hantle)', 2, 'Kładziemy się na ławce skośnej(tłów wyżej niż głowa), chwytamy hantle, przyciagamy do klatki piersiowej, a nastepnie wypychamy');
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Rozpiętki', 2);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Pompki', 1);
#barki
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wyciskanie żołnierskie', 1);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wyciskanie Hantli', 1);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wymachy', 1);
#triceps
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Dipsy', 4);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('TPD', 4);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wyciskanie Francuskie', 4);
#biceps
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Podnoszenie Hantli', 3);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wąskie wyciskanie', 3);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Modlitewnik', 3);
#plecy
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Podciąganie szerokie', 5);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Martwy ciąg', 5);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Ściąganie do klaty', 5);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Ściąganie do barków', 5);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wiosłowanie sztangą', 5);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Wiosłowanie półsztangą', 5);
#brzuch
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Brzuszki', 6);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Nożyce', 6);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Allahy', 6);
#nogi
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Przysiad klasyczny', 7);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Przysiad front', 7);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Lydki Smith', 7);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Suwnica', 7);
INSERT INTO `cwiczenia` (`nazwa`, `id_partii_miesni`) values('Zakroki', 7);