FROM python:3.9

WORKDIR /usr/src/projeto_academia

COPY ./ ./

RUN python server.py

CMD ["/bin/bash"]