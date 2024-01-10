from flask import Flask, render_template, url_for, request
from flask_mysqldb import MySQL
import pandas as pd
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

# headings = ("Name", "Role", "Salary")
# data = (
#     ("John", "Software Engineer", 5000),
#     ("Jane", "Senior Software Engineer", 7000),
#     ("Dave", "Software Architect", 10000),
#     ("Mary", "Project Manager", 12000),
#     ("Kate", "Product Manager", 16000))

@app.route('/process_query', methods=['GET', 'POST'])
def process_query():
    if request.method == 'POST':
        raw_query = request.form['raw_query']
        
        try:
            # Using the MySQL connection
            cursor = mysql.connection.cursor()
            
            # Execute the raw query
            cursor.execute(raw_query)
            
            # Fetch the results
            header = (col[0] for col in cursor.description) # get column names
            #header.insert(0, "ID") # add ID column
            init_result = cursor.fetchall()
            
            
            # Create a DataFrame from the results
            result = pd.DataFrame(init_result, columns=header)
            
            # Convert DataFrame to HTML with Bootstrap styles
            result_html = result.to_html(classes='table table-hover table-responsive', index= True, index_names=True)
            
            # Get column headings
            #headings = result.columns.tolist()
            
            # Pass data and headings to the template
            return render_template('index.html', table=result_html)
        
        except Exception as e:
            error_message = f"Error executing query: {e}"
            return render_template('index.html', table="no results")

if __name__=='__main__':
    app.run(debug=True, use_reloader=True)