FROM python:3.11

LABEL author="Mingchung Xia"
LABEL project="cardmaster, HackHarvard 2023"

WORKDIR /app

COPY . /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

COPY start.sh /app

RUN chmod +x start.sh

CMD ["./start.sh"]

