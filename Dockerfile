FROM python:3.6

RUN echo "start....................."
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install redis==2.10.3
RUN pip install uWSGI
RUN pip install Flask==1.0.3
RUN pip install requests==2.5.1

WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
#CMD ["uwsgi","--http","0.0.0.0:9090","--wsgi-file","/app/identidock.py",\
 #   "--callable","app","--stats","0:0:0:0:9191"]