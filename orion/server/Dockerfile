# https://github.com/LINKIWI/orion-server
FROM python:2.7.16-slim

RUN apt-get update \ 
    && apt-get install -y wget unzip python-dev \ 
    default-libmysqlclient-dev gcc build-essential

RUN wget -O orion-server-master.zip https://github.com/LINKIWI/orion-server/archive/master.zip \
    && unzip orion-server-master.zip
WORKDIR "/orion-server-master"

RUN pip install -r requirements.txt && pip install gunicorn

ENV PYTHONPATH "/orion-server-master"

EXPOSE 8080

CMD make init-db && gunicorn --bind 0.0.0.0:8080 -w 4 orion.server:app
