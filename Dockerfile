FROM python:3.9-alpine

RUN apk add -U --no-cache python3-dev py3-pip build-base

WORKDIR /usr/src/projeto_academia

COPY ./ ./

RUN pip3 install -r requirements.txt

RUN rm -f requirements.txt

EXPOSE 8080

CMD ["python3", "-u", "-m", "flask", "run", "--host=0.0.0.0", "bin/bash"]