
FROM alpine:3.11

WORKDIR /app

COPY flask-app .

RUN apk add py2-pip  python2 

RUN pip install -r /app/flask-app/requirements.txt

RUN apk add --update nodejs npm

RUN npm build /app/flask-app/package.json