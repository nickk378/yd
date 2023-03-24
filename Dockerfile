FROM ubuntu:bionic
ARG DEBIAN_FONTEND=noninteractive
RUN apt-get update && apt-get -y install python3 python3-pip python3-venv
RUN python3 -m venv venv

WORKDIR /app

# install dependencies
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

# Copy project
COPY . .
EXPOSE 8000
RUN chmod +x /code/start.sh
ENTRYPOINT ["./start.sh"]
