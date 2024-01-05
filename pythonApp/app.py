from flask import Flask, render_template, url_for, request
from flask_mysqldb import MySQL

app = Flask(__name__)

# mySQL configurations
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'None'
app.config['MYSQL_DB'] = 'exam'

mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/process_query', methods=['GET', 'POST'])
def process_query():
    if request.method == 'POST':
        raw_query = request.form['raw_query']
        
        # Using the MySQL connection
        cursor = mysql.connection.cursor()
        cursor.execute(raw_query)
        result = cursor.fetchall()
        return render_template('index.html', raw_query=raw_query, result=request)

if __name__=='__main__':
    app.run(debug=True, use_reloader=True)