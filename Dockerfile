
FROM alpine:3.11 AS appbuild

WORKDIR /app

ADD flask-app ./flask-app

RUN apk add py2-pip  python2 

RUN pip install -r $(pwd)/flask-app/requirements.txt

RUN apk add --update nodejs npm

WORKDIR /app/flask-app

RUN npm install


FROM alpine:3.11

WORKDIR /app

COPY --from=appbuild /app/flask-app ./flask-app

RUN apk add py2-pip  python2 

RUN pip install -r $(pwd)/flask-app/requirements.txt

CMD [ "python" , "/app/flask-app/app.py" ]

