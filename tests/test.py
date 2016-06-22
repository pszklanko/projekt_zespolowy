# can run by command : 
# python web2py.py -S projekt_zespolowy -M -R applications/projekt_zespolowy/tests/test.py

import unittest

from gluon.storage import Storage
from gluon.globals import Request
import gluon.contrib.simplejson as json

execfile("applications/projekt_zespolowy/controllers/default.py", globals())

# its clearing all tables in databes, bcs we can only tests database with empty tables
# we have to clear tables in order reverse to create

db(db.historia_treningow.id>0).delete()  # Clear the database historia_treningow table
db.commit()

db(db.treningi.id>0).delete()  # Clear the database treningi table
db.commit()

db(db.cwiczenia.id>0).delete()  # Clear the database cwiczenia table
db.commit()


db(db.diety.id>0).delete()  # Clear the database diety table
db.commit()

db(db.adres_uzytkownika.id>0).delete()  # Clear the database adres_uzytkownika table
db.commit()

db(db.uzytkownicy.id>0).delete()  # Clear the database uzytkownicy table
db.commit()

db(db.rodzaje_diet.id>0).delete()  # Clear the database rodzaje_diet table
db.commit()

db(db.produkty.id>0).delete()  # Clear the database produkty table
db.commit()

db(db.producent.id>0).delete()  # Clear the database producent table
db.commit()

db(db.miasta.id>0).delete()  # Clear the database miasta table
db.commit()

db(db.wojewodztwa.nazwa != '').delete()  # Clear the database wojewodztwa table
db.commit()

db(db.partia_miesni.id>0).delete()  # Clear the database parita_miesni table
db.commit()

db(db.dzien_tygodnia.id>0).delete()  # Clear the database dzien_tygodnia table
db.commit()


class TestDB(unittest.TestCase):

    def testA1EmptyProducentsList(self):
        
        selected = db.producent.ALL
    	records = db().select(selected)

    	assert len(records) == 0, "Not empty producent table"

    def testA2EmptyTrainingsHistoryList(self):
        
        selected = db["historia_treningow"].ALL
        records = db().select(selected)

        assert len(records) == 0, "Not empty historia_treningow table"

    def testA3EmptyTrainingsList(self):
	        
	    selected = db.treningi.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty trainings table"

    def testA4EmptyExcercisesList(self):
	        
	    selected = db.cwiczenia.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Excercises table"

    def testA5EmptyDietsList(self):
	        
	    selected = db.diety.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Diets table"

    def testA6EmptyUsersAdressesList(self):
	        
	    selected = db.adres_uzytkownika.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Users Adresses table"

    def testA7EmptyUsersList(self):
	        
	    selected = db.uzytkownicy.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Users table"

    def testA8EmptyDietsTypesList(self):
	        
	    selected = db.rodzaje_diet.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Diets Types table"

    def testA9EmptyProductsList(self):
	        
	    selected = db.produkty.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Products table"

    def testB1EmptyCities(self):
	        
	    selected = db.miasta.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Cities table"


    def testB2EmptyMusclesPartList(self):
	        
	    selected = db.partia_miesni.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Muscles Parts table"

    def testB3EmptyDaysList(self):
	        
	    selected = db.dzien_tygodnia.ALL
	    records = db().select(selected)

	    assert len(records) == 0, "Not empty Days table"



    def testB4InsertMusclesPartRecord(self):
	        
	    db.partia_miesni.insert(nazwa="plecy")

	    selected = db.partia_miesni.ALL
	    records = db().select(selected)


	    assert records[0].nazwa == "plecy", "Empty Muscles Parts table  - first"


    def testB5NextInsertMusclesPartRecord(self):
	        
	    db.partia_miesni.insert(nazwa="nogi")

	    selected = db.partia_miesni.ALL
	    records = db().select(selected)


	    assert records[1].nazwa == "nogi", "Empty Muscles Parts table - next"

    def testB6InsertProducentRecord(self):
	        
	    db.producent.insert(nazwa="danone")

	    selected = db.producent.ALL
	    records = db().select(selected)


	    assert records[0].nazwa == "danone", "Empty Producents table  - first"

    def testB7NextInsertProducentsRecord(self):
	        
	    db.producent.insert(nazwa="zoot")

	    selected = db.producent.ALL
	    records = db().select(selected)


	    assert records[1].nazwa == "zoot", "Empty Producents table  - next"

    def testB8InsertProductsRecord(self):
	   
	    records2 = db(db.producent.nazwa != None).select()
	    prod_id = records2[0].id

	    db.produkty.insert(nazwa="bakus", weglowodany=5.0, bialka= 2.0, tluszcze=2.0, ilosc_kalorii=100.0, id_producenta=prod_id)


	    selected = db.produkty.ALL
	    records = db().select(selected)


	    assert (records[0].nazwa == "bakus") & (
	    	records[0].weglowodany == 5.0) & (
	    	records[0].bialka == 2.0) & (
	    	records[0].tluszcze == 2.0) & (
	    	records[0].ilosc_kalorii == 100.0), "Empty Products table  - first"

    def testB9NextInsertProductsRecord(self):
	   
	    records2 = db(db.producent.nazwa != None).select()
	    prod_id = records2[0].id

	    db.produkty.insert(nazwa="twarog", weglowodany=15.0, bialka= 12.0, tluszcze=12.0, ilosc_kalorii=120.0, id_producenta=prod_id)


	    selected = db.produkty.ALL
	    records = db().select(selected)


	    assert (records[1].nazwa == "twarog") & (
	    	records[1].weglowodany == 15.0) & (
	    	records[1].bialka == 12.0) & (
	    	records[1].tluszcze == 12.0) & (
	    	records[1].ilosc_kalorii == 120.0), "Empty Products table  - next"


    def testC1InsertDietsPartsRecord(self):
	        
	    db.rodzaje_diet.insert(nazwa="bialkowa")

	    selected = db.rodzaje_diet.ALL
	    records = db().select(selected)


	    assert records[0].nazwa == "bialkowa", "Empty Diets table - first"

    def testC2NextInsertDietsPartsRecord(self):
	        
	    db.rodzaje_diet.insert(nazwa="weglowodanowa")

	    selected = db.rodzaje_diet.ALL
	    records = db().select(selected)


	    assert records[1].nazwa == "weglowodanowa", "Empty Diets table - next"

    def testC3InsertDaysRecord(self):
	        
	    db.dzien_tygodnia.insert(nazwa="poniedzialek")

	    selected = db.dzien_tygodnia.ALL
	    records = db().select(selected)


	    assert records[0].nazwa == "poniedzialek", "Empty Days table - first"

    def testC4NextInsertDaysRecord(self):
	        
	    db.dzien_tygodnia.insert(nazwa="wtorek")

	    selected = db.dzien_tygodnia.ALL
	    records = db().select(selected)


	    assert records[1].nazwa == "wtorek", "Empty Days table - next"

    def testC5InsertExcercisesRecord(self):
	    
	    records2 = db(db["partia_miesni"].nazwa !=None).select()
	    part_id = records2[0].id

	    db.cwiczenia.insert(nazwa="pompki", id_partii_miesni=part_id, opis="oczywiste cwiczenie - nie wymaga opisu")

	    selected = db.cwiczenia.ALL
	    records = db().select(selected)


	    assert (records[0].nazwa == "pompki"
	    	) & (records[0].opis == "oczywiste cwiczenie - nie wymaga opisu"
	    	), "Empty Days table - first"   

    def testC6NextInsertExcercisesRecord(self):
	    
	    records2 = db(db["partia_miesni"].nazwa !=None).select()
	    part_id = records2[1].id

	    db.cwiczenia.insert(nazwa="brzuszki", id_partii_miesni=part_id, opis="oczywiste cwiczenie - nie wymaga opisu")

	    selected = db.cwiczenia.ALL
	    records = db().select(selected)


	    assert (records[1].nazwa == "brzuszki"
	    	) &(records[1].opis == "oczywiste cwiczenie - nie wymaga opisu"
	    	), "Empty Days table - next"  

suite = unittest.TestSuite()
suite.addTest(unittest.makeSuite(TestDB))
unittest.TextTestRunner(verbosity=2).run(suite)


#.fa-fw {
#  width: 1.28571429em;
#  text-align: center;
#  line-height: 45px;
#}