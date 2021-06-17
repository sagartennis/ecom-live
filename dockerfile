FROM python

EXPOSE 8000

RUN apt-get update

ADD . /ecom-live

RUN pip install -r ecom-live/requirements.txt

RUN python ecom-live/manage.py makemigrations

RUN python ecom-live/manage.py migrate

CMD [ "python","ecom-live/manage.py","runserver","0.0.0.0:8000" ]
