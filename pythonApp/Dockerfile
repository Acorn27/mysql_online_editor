FROM python:latest


WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5000

# Run app.py when the container launches
CMD ["python","-m", "flask", "run", "--host=0.0.0.0"]

