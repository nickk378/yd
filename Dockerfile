FROM ubuntu:22.04


RUN apt-get update && add-apt-repository ppa:deadsnakes/ppa && apt-get -y install python3
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
