
FROM alpine:3.11

WORKDIR /app

ADD flask-app ./flask-app

RUN apk add py2-pip  python2 

RUN pip install -r $(pwd)/flask-app/requirements.txt

RUN apk add --update nodejs npm

RUN npm build /app/flask-app