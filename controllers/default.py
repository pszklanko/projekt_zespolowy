# -*- coding: utf-8 -*-
# this file is released under public domain and you can use without limitations

# -------------------------------------------------------------------------
# This is a sample controller
# - index is the default action of any application
# - user is required for authentication and authorization
# - download is for downloading files uploaded in the db (does streaming)
# -------------------------------------------------------------------------

import gluon.contrib.simplejson as json

def index():
    """
    example action using the internationalization operator T and flash
    rendered by views/default/index.html or views/generic.html

    if you need a simple wiki simply replace the two lines below with:
    return auth.wiki()
    """
    response.flash = T("Hello World")
    return dict(message=T('Welcome to web2py!'))


def user():
    """
    exposes:
    http://..../[app]/default/user/login
    http://..../[app]/default/user/logout
    http://..../[app]/default/user/register
    http://..../[app]/default/user/profile
    http://..../[app]/default/user/retrieve_password
    http://..../[app]/default/user/change_password
    http://..../[app]/default/user/bulk_register
    use @auth.requires_login()
        @auth.requires_membership('group name')
        @auth.requires_permission('read','table name',record_id)
    to decorate functions that need access control
    also notice there is http://..../[app]/appadmin/manage/auth to allow administrator to manage users
    """
    return dict(form=auth())


@cache.action()
def download():
    """
    allows downloading of uploaded files
    http://..../[app]/default/download/[filename]
    """
    return response.download(request, db)


def call():
    """
    exposes services. for example:
    http://..../[app]/default/call/jsonrpc
    decorate with @services.jsonrpc the functions to expose
    supports xml, json, xmlrpc, jsonrpc, amfrpc, rss, csv
    """
    return service()

def main():
    # This method is necessary to allow views/default/main.html to be rendered
    return dict()

def diets():
    # This method is necessary to allow views/default/diets.html to be rendered
    return dict()

def products():
    # This method is necessary to allow views/default/products.html to be rendered
    return dict()

def trainings():
    # This method is necessary to allow views/default/trainings.html to be rendered
    return dict()

# funkcja zwracajaca rekordy wedlug kryteriow wyszukiwania
# jesli brak kryteriow zwraca wszystkie dostepne
def getRecord():
    data = json.loads(request.body.read())
    #data['table'] = 'adres_uzytkownika'
    selected = []
    if data['table'] == 'producent':
        for row in db().select(db.producent.ALL):
            selected.append({
                "id": row.id,
                "nazwa_producenta": row.nazwa
            })

    if data['table'] == 'rodzaje_diet':
        for row in db().select(db[data['table']].ALL):
            selected.append({
                "id": row.id,
                "nazwa": row.nazwa
            })

    if data['table'] == 'uzytkownicy':
        for row in db().select(db[data['table']].ALL):
            selected.append({
                "id": row.id,
                "login": row.login,
                "haslo": row.haslo
            })

    if data['table'] == 'treningi':
        for row in db().select(db[data['table']].ALL):
            selected.append({
                "id_cwiczenia": row.id_cwiczenia,
                "id_uzytkownika": row.id_uzytkownika,
                "id_dnia": row.id_dnia
            })

    if data['table'] == 'diety':
        rows = db((db.diety.id_rodzaj_diety == db.rodzaje_diet.id) &
        (db.diety.id_produktu == db.produkty.id) &
        (db.rodzaje_diet.deleted != 1) &
        (db.produkty.deleted != 1) &
        (db.diety.deleted != 1) &
        (db.diety.id_uzytkownika == data['attr'])).select(db.diety.id,
        db.rodzaje_diet.nazwa, db.produkty.nazwa)
        for row in rows:
            selected.append({
                "id": row.diety.id,
                "nazwa_produktu": row.produkty.nazwa,
                "rodzaj_diety": row.rodzaje_diet.nazwa
            })

    if data['table'] == 'produkty':
        rows = db((db.produkty.deleted != 1) &
        (db.producent.deleted != 1) &
        (db.produkty.id_producenta == db.producent.id)).select(db.produkty.ALL, db.producent.nazwa)
        for row in rows:
            selected.append({
                "id": row.produkty.id,
                "nazwa_produktu": row.produkty.nazwa,
                "z_weglowodany": row.produkty.weglowodany,
                "z_bialka": row.produkty.bialka,
                "z_tluszcze": row.produkty.tluszcze,
                "ilosc_kalorii": row.produkty.ilosc_kalorii,
                "nazwa_producenta": row.producent.nazwa
            })

    #nalezy podać jak parametr OBOWIAZKOWY id_uzytkownika dla ktorego wyswietlamy treningi
    #na razie na sztywno jest '1'
    if data['table'] == 'historia_treningow':
        rows = db((db.historia_treningow.id_uzytkownika == 1) &
            (db.historia_treningow.deleted != 1) &
            (db.cwiczenia.deleted != 1) &
            (db.historia_treningow.id_cwiczenia == db.cwiczenia.id)).select(db[data['table']].ALL,
            db.cwiczenia.nazwa)
        for row in rows:
            selected.append({
                "id": row.historia_treningow.id,
                "nazwa_cwiczenia": row.cwiczenia.nazwa,
                "ilosc_serii": row.historia_treningow.ilosc_serii,
                "ilosc_powtorzen": row.historia_treningow.ilosc_powtorzen,
                "obciazenie": row.historia_treningow.obciazenie,
                "data_dodania": str(row.historia_treningow.data_dodania)
            })

    if data['table'] == 'cwiczenia':
        rows = db((db.cwiczenia.deleted != 1) &
        (db.partia_miesni.deleted != 1) &
        (db.cwiczenia.id_partii_miesni == db.partia_miesni.id)).select(db.cwiczenia.ALL,
        db.partia_miesni.nazwa)
        for row in rows:
            selected.append({
                "id": row.cwiczenia.id,
                "nazwa_cwiczenia": row.cwiczenia.nazwa,
                "nazwa_partii_miesni": row.partia_miesni.nazwa,
                "opis_cwiczenia": row.cwiczenia.opis
            })

    if data['table'] == 'adres_uzytkownika':
        rows = db((db.adres_uzytkownika.deleted != 1) &
        (db.adres_uzytkownika.id_uzytkownika == 1) &
        (db.uzytkownicy.deleted != 1) &
        (db.miasta.deleted != 1) &
        (db.adres_uzytkownika.id_uzytkownika == db.uzytkownicy.id) &
        (db.adres_uzytkownika.id_miasta == db.miasta.id)).select(db.miasta.nazwa,
        db.uzytkownicy.login)
        for row in rows:
            selected.append({
                "login": row.uzytkownicy.login,
                "nazwa_miasta": row.miasta.nazwa,
                "ulica": row.adres_uzytkownika.ulica,
                'nr_mieszkania': row.adres_uzytkownika.nr_mieszkania
            })
    return json.dumps(selected)

# uniwersalne dodawanie rekordu do bazy
def addRecord():
    data = json.loads(request.body.read())
    table = data['table']
    resp = db[table].insert(**data['attr'])
    return json.dumps(resp)
