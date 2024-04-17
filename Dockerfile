FROM python:3.9
ARG DB_STRING

WORKDIR /app

COPY requirements.txt .
ENV SQLALCHEMY_URL=${DB_STRING}

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN pip install python-dotenv
# RUN pip install --index-url https://phonepe.mycloudrepo.io/public/repositories/phonepe-pg-sdk-python --extra-index-url https://pypi.org/simple phonepe_sdk

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["python", "-m", "flask", "run"]
# CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "--timeout", "600", "app:app"]
