from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode


DB_HOST = 'mariadb'  # environ.get('DB_HOST')
DB_NAME = 'academia'  # environ.get('DB_NAME')
DB_USER = 'acadadmin'  # environ.get('DB_USER')
DB_PASSWORD = 'acad123'  # environ.get('MARIADB_PASSWORD')


def run_insert_query(query, values, table_name):
    connection = get_database_connection()
    res = ''
    id = None
    try:
        cursor = connection.cursor()
        cursor.execute(query, values)
        connection.commit()
        id = cursor.lastrowid
        if id is not None:
            res += 'Record with id('+str(id) + \
                ') inserted successfully into '+table_name+' table'
        else:
            res += str(cursor.rowcount) + \
                ' Record inserted successfully into '+table_name+' table'
        print(res)
        cursor.close()
    except mysql.connector.Error as error:
        res += "Failed to inser record into table {}".format(error)
        print(res)
    finally:
        if connection.is_connected():
            connection.close()
    return (res, id)


def run_select_query(query):
    connection = get_database_connection()
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        res = cursor.fetchall()
        for x in res:
            print(x)
        print(res)
        cursor.close()
    except mysql.connector.Error as error:
        res = "Failed to select from table {}".format(error)
        print(res)
    finally:
        if connection.is_connected():
            connection.close()
    return json.dumps(res, ensure_ascii=False)


def get_database_connection():
    return mysql.connector.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASSWORD)
