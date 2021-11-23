FROM python:3.8

WORKDIR /data/yscase

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.1/wait /wait
RUN chmod +x /wait



RUN flake8 .

EXPOSE 8000


CMD /wait && python manage.py migrate
CMD /wait && python manage.py collectstatic
CMD /wait && python manage.py test
CMD /wait && python manage.py runserver 0.0.0.0:8000
