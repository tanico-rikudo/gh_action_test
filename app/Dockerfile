FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev

WORKDIR /usr/app/src
COPY ./app/src/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /usr/app
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
