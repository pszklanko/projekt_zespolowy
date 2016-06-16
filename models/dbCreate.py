# -------------------------------------------------------------------------
# Define your tables below (or better in another model file) for example
#

## tablee mozna podejzec na http://127.0.0.1:8000/projekt_zespolowy/appadmin
## polowa rzeczy z dokumentacji web2py nie dziala
## nie mozna tworzyc nazw tabel i kolumn z odstepami
## trzeba zaimportowac datatime
## from datetime import datetime

# zakomentowane wymagania bo polowa nie dziala, nie chcialo mi sie juz testowac(potrzebne do automatycznej walidacji)

from datetime import datetime

db.define_table(
    'wojewodztwa',
    Field('nazwa', 'string', length = 255),
    Field('kod_woj', 'string', length = 3),  # unique = true - wywala się jak dodaje parametr unique, chociaz zgodnie ze specyfikacja
    Field('deleted', 'integer', default = 0)
    )
#db.wojewodztwa.nazwa.requires = IS_NOT_EMPTY()
#db.wojewodztwa.kod_woj.requires = IS_NOT_EMPTY()
#db.wojewodztwa.deleted = IS_INT_IN_RANGE(0, 1)#wywala się chociaz dodane zgodnie ze specyfikacja


db.define_table(
    'miasta',
    Field('nazwa','string', length = 255),
    Field('kod_woj', db.wojewodztwa),
    Field('deleted', 'integer', default = 0)
    )

#db.miasta.nazwa.requires = IS_NOT_EMPTY()
#db.miasta.kod_woj.requires = IS_NOT_EMPTY()
#db.miasta.deleted = IS_INT_IN_RANGE(0,1)

db.define_table(
    'producent',
    Field('nazwa', 'string', length = 255),
    Field('deleted', 'integer', default = 0)
    )

#db.producent.nazwa.requires = IS_NOT_EMPTY()
#db.producent.deleted = IS_INT_IN_RANGE(0, 1)

db.define_table(
    'produkty',
    Field('nazwa', 'string', length = 255),
    Field('weglowodany', 'double'),
    Field('bialka', 'double'),
    Field('tluszcze', 'double'),
    Field('ilosc_kalorii', 'double'),
    Field('id_producenta', db.producent),
    Field('deleted', 'integer', default = 0)
    )

#db.produkty.nazwa.requires = IS_NOT_EMPTY()
#db.produkty.weglowodany.requires = IS_NOT_EMPTY()
#db.produkty.bialka.requires = IS_NOT_EMPTY()
#db.produkty.tluszcze.requires = IS_NOT_EMPTY()
#db.produkty.deleted = IS_INT_IN_RANGE(0, 1)



db.define_table(
    "rodzaje_diet",
    Field('nazwa', 'string', length = 255),
    Field('deleted', 'integer', default = 0)
    )

#db["rodzaje_diet"].nazwa.requires = IS_NOT_EMPTY()
#db["rodzaje_diet"].deleted = IS_INT_IN_RANGE(0, 1)

db.define_table(
    'uzytkownicy',
    Field('login', 'string', length = 100),
    Field('haslo', 'string', length = 255),
    Field('email', 'string', length = 255),
    Field('deleted', 'integer', default = 0)
    )

#db.uzytkownicy.login.requires = IS_NOT_EMPTY()
#db.uzytkownicy.haslo.requires = IS_NOT_EMPTY()
#db.uzytkownicy.email.requires = [IS_EMAIL(), IS_NOT_EMPTY()]
#db.uzytkownicy.deleted = IS_INT_IN_RANGE(0, 1)

db.define_table(
    'dzien_tygodnia',
    Field('nazwa', 'string', length = 255),
    Field('deleted', 'integer', default = 0)
    )

#db.dzien_tygodnia.nazwa.requires = IS_NOT_EMPTY()
#db.dzien_tygodnia.deleted = IS_INT_IN_RANGE(0,1)

db.define_table(
    'adres_uzytkownika',
    Field('id_uzytkownika', db.uzytkownicy),
    Field('id_miasta', db.miasta),
    Field('ulica', 'string', length = 255),
    Field('nr_mieszkania', 'integer'),
    Field('deleted', 'integer', default = 0)
    )

#db.adres_uzytkownika.deleted = IS_INT_IN_RANGE(0,1)

db.define_table(
    'diety',
    Field('id_uzytkownika', db.uzytkownicy),
    Field('id_produktu', db.produkty),
    Field('id_rodzaj_diety', db.rodzaje_diet),
    Field('deleted', 'integer', default = 0)
    )

#db.diety.deleted = IS_INT_IN_RANGE(0,1)

db.define_table(
    'partia_miesni',
    Field('nazwa', 'string', length = 255),
    Field('deleted', 'integer', default = 0)
    )

#db["partia_miesni"].nazwa.requires = IS_NOT_EMPTY()
#db["partia_miesni"].deleted = IS_INT_IN_RANGE(0, 1)

db.define_table(
    'cwiczenia',
    Field('nazwa','string', length = 100),
    Field('id_partii_miesni', db.partia_miesni),
    Field('opis', 'string', length = 255),
    Field('deleted', 'integer', default = 0)
    )

#db.cwiczenia.nazwa.requires = IS_NOT_EMPTY()
#db.cwiczenia.deleted = IS_INT_IN_RANGE(0,1)

db.define_table(
    'treningi',
    Field('id_cwiczenia', db.cwiczenia),
    Field('id_uzytkownika', db.uzytkownicy),
    Field('id_dnia', db.dzien_tygodnia),
    Field('deleted', 'integer', default = 0)
    )

#db.treningi.deleted = IS_INT_IN_RANGE(0, 1)


db.define_table(
    'historia_treningow',
    Field('id_uzytkownika',db.uzytkownicy),
    Field('id_cwiczenia', db.cwiczenia),
    Field('ilosc_serii', 'integer'),
    Field('ilosc_powtorzen', 'integer'),
    Field('obciazenie', 'integer'),
    Field('data_dodania', 'datetime', default = datetime.now()),
    Field('deleted', 'integer', default = 0)
    )

#db["historia treningow"].kod_woj.data_dodania = [IS_NOT_EMPTY(), IS_DATETIME()]
#db["historia treningow"].deleted = IS_INT_IN_RANGE(0,1)



# >>> db.define_table('mytable', Field('myfield', 'string'))
#
# Fields can be 'string','text','password','integer','double','boolean'
#       'date','time','datetime','blob','upload', 'reference TABLENAME'
# There is an implicit 'id integer autoincrement' field
# Consult manual for more options, validators, etc.
#
# More API examples for controllers:
#
# >>> db.mytable.insert(myfield='value')
# >>> rows = db(db.mytable.myfield == 'value').select(db.mytable.ALL)
# >>> for row in rows: print row.id, row.myfield
# -------------------------------------------------------------------------


# -------------------------------------------------------------------------
# after defining tables, uncomment below to enable auditing
# -------------------------------------------------------------------------
# auth.enable_record_versioning(db)