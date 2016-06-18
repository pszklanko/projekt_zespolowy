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

def getTestName():
    #a = ['kamil','marcin','piotrek']
    a = db.executesql('SELECT * from miasta;')
    return json.dumps(a)

# funkcja zwracajaca rekordy wedlug kryteriow wyszukiwania
# jesli brak kryteriow zwraca wszystkie dostepne
def getRecord():
    data = json.loads(request.body.read())
    if data['table'] == 'diety':
        pass
    elif cond:
        pass
    return 0

# uniwersalne dodawanie rekordu do bazy
# TODO teoretycznie to jest ok (w innych projektach dziala), obstawiam,
# TODO że trzeba zdefiniować tabele w web2py (web2py/scripts/extract_mysql_models.py)
# TODO problem nie wystepuje przy kazdej tabeli - moze to cos z zaleznosciami miedzy nimi
# TODO web2py czegos nie ogarnia, albo cos jest zle zdefiniowane
def addRecord():
    data = json.loads(request.body.read())
    print data
    table = data['table']
    resp = db[table].insert(**data['attr'])
    return resp

def addSimplyProduct():
    db.produkty.insert(nazwa = 'kielba', weglowodany = 10.0, bialka = 10.0, tluszcze = 10.0, ilosc_kalorii =100.0, id_producenta = 1 )
    return 1