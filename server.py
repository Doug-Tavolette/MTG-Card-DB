from flask import Flask
from flask_restful import Resource, Api

from swen344_db_utils import exec_sql_file
# from api.menu import *
# from db.example import rebuild_tables
# from api.food_drink import *
# from api.manage import *
# from api.orders import *

app = Flask(__name__)
api = Api(app)

# api.add_resource(Food, '/food')
# api.add_resource(Drink,'/drink')
# api.add_resource(Init, '/manage/init')
# api.add_resource(Version, '/manage/version')
# api.add_resource(Menu,'/menu') #Gets all pairing menu items
# api.add_resource(MenuItem,'/menu/<string:id>') #Can't have 2 different endpoints on same handler, so create MenuItem
# api.add_resource(MenuItemTaxes,'/menu_taxes')
# api.add_resource(MenuItemTaxesDirect,'/menu_taxes_direct')
# #api.add_resource(Menu, '/menu/<string:searchTerm>') #Try to add a search string
# api.add_resource(Orders, '/menu_orders')


if __name__ == '__main__':
    exec_sql_file('src/db/Schema.sql') #Before server starts, init the DB
    app.run(debug=True)
