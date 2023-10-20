FROM python:3.10.10-buster

WORKDIR /flaskr

ENV FLASK_RUN_HOST=0.0.0.0

ARG DOCKER_TAG

ENV APP_VERSION=${DOCKER_TAG}

RUN mkdir -pv app

COPY app/ app/

COPY pyproject.toml .

RUN pip install -e .

RUN pip install -r app/requirements.txt

EXPOSE 8000

CMD [ "flask", "--app", "app", "run"]
