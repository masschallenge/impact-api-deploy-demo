FROM python:3.6

WORKDIR /wwwroot

COPY impact /wwwroot

COPY scripts/start.sh /usr/bin

RUN apt-get update -y

RUN apt-get install -y netcat mysql-client

RUN pip install --upgrade pip

RUN pip3 install -r requirements.txt

RUN useradd -s /bin/bash -u 3000 -M impact_user

RUN chown impact_user /usr/bin/start.sh

RUN chown -R impact_user /wwwroot

USER impact_user

ENV PYTHONUNBUFFERED 1

EXPOSE 8000

CMD ["/bin/bash" , "/usr/bin/start.sh"]
