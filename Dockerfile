# pull official base image
FROM python:alpine3.7


# set work directory
WORKDIR /usr/src/app

RUN apk update

# set environment variables
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV AWS_REGION eu-west-2 
ENV STARTUP_SIGNUP_TABLE=${STARTUP_SIGNUP_TABLE}
ENV NEW_SIGNUP_TOPIC=${NEW_SIGNUP_TOPIC}

# install dependencies
RUN pip install --upgrade pip
COPY . /usr/src/app
RUN pip install -r requirements.txt && pip install flask


EXPOSE 5000

ENTRYPOINT ["python"]
CMD ["application.py"]

