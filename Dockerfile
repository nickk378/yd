FROM python:3.10

RUN apt update && apt upgrade -y
RUN python3 -m venv venv

WORKDIR /app

# install dependencies
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

# Copy project
COPY . .
EXPOSE 8000
RUN chmod +x ./start.sh
ENTRYPOINT ["./start.sh"]
