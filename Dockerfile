# pull official base image
FROM python:alpine3.7


# set work directory
WORKDIR /usr/src/app

RUN apk update

# set environment variables
ENV AWS_REGION eu-west-2 
ENV STARTUP_SIGNUP_TABLE dev-user-signup-dynamo
ENV NEW_SIGNUP_TOPIC arn:aws:sns:eu-west-2:735287868690:dev-user-signup-topic

# install dependencies
RUN pip install --upgrade pip
COPY . /usr/src/app
RUN pip install -r requirements.txt && pip install flask


EXPOSE 5000

ENTRYPOINT ["python"]
CMD ["application.py"]

