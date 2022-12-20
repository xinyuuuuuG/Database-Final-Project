from flask import Flask, render_template, request, redirect, url_for
from mysql2python import python_connect_mysql, operation_to_sql
from config_from_yaml import config_from_yaml_file

config = config_from_yaml_file("config.yaml")
table_names = python_connect_mysql(config, state='show_tables')

app = Flask(__name__)
@app.route('/')
def p1():
   return redirect(url_for('homepage'))

@app.route('/homepage')
def homepage():
   return render_template('2433.html', table_names=table_names)

@app.route('/table', methods=['POST', 'GET'])
def table():
   if request.method == 'POST':
      result = request.form
      table_name = result['table_name']
      col_names = python_connect_mysql(config, state='show_col', table_name=table_name)
      data = python_connect_mysql(config, table_name=table_name)
      return render_template("table.html", table_name=table_name, col_names=col_names, data=data)
   
@app.route('/action', methods=['POST', 'GET'])
def action():
   if request.method == 'GET':
      return redirect(url_for('homepage'))
   else:
      result = request.form
      table_name = result['table_name']
      col_names = python_connect_mysql(config, state='show_col', table_name=table_name)
      data = python_connect_mysql(config, table_name=table_name)
      action = result['operation']

      if action == 'insert':
         return render_template("insert.html", table_name=table_name, col_names=col_names, data=data, operation_name=action)
      elif action == 'delete':
         return render_template("delete.html", table_name=table_name, col_names=col_names, data=data, oration_namepe=action)
      elif action == 'update':
         return render_template("update.html", table_name=table_name, col_names=col_names, data=data, operation_name=action)

@app.route('/success', methods=['POST', 'GET'])
def operation_toSQL():
   if request.method == 'POST':
      result = request.form
      table_name = result['table_name']
      col_names = python_connect_mysql(config, state='show_col', table_name=table_name)
      data = python_connect_mysql(config, table_name=table_name)

      query = operation_to_sql(config, col_names=col_names, input_value=result, data=data, operation=result["operation_name"])
      return render_template("action.html", result=result, query=query)

@app.route('/success/1', methods=['POST', 'GET'])
def succ():
   if request.method == 'GET':
      return redirect(url_for('homepage'))

if __name__ == '__main__':
   app.run(debug = True)