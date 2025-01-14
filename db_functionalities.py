from swen344_db_utils import *
import array

#this function turns the abilities_effected string into an array of numbers
def get_effected_abilities(item):
    sql = """SELECT abilities_effected FROM item WHERE item.name = %s"""
    result = exec_get_one(sql, item)
    num = result[0]
    arr = array.array('i', (int(digit) for digit in num))
    return arr

def create_item(name, rarity, abilities_effected, description, quest_bonus):
    sql = """INSERT INTO item (name, rarity, abilities_effected, description, quest_bonus) VALUES (%s, %s, %s, %s, %s)"""
    exec_commit(sql, (name, rarity, abilities_effected, description, quest_bonus))