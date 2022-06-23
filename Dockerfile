#FROM python:3.9.6
#
#WORKDIR /usr/src/app
#
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1
#
#RUN apt-get update \
#    && apt-get install netcat -y
#RUN apt-get upgrade -y && apt-get install postgresql gcc python3-dev musl-dev -y
#RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
#    cd /usr/local/bin && \
#    ln -s /opt/poetry/bin/poetry && \
#    poetry config virtualenvs.create false
#
#COPY ./pyproject.toml ./poetry.lock* /usr/src/app/
#
#RUN poetry install
#
#COPY . /usr/src/app/


FROM python:3.9.9

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY ./req.txt /usr/src/app/

RUN pip install -r req.txt

COPY . /usr/src/app/
