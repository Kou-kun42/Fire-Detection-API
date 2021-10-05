# TODO: pull down the "slim" version of Python 3.6
FROM python:3.6-slim
# TODO: copy the app/ and classifier/ folders, as well as requirements.txt
COPY app/ /app/
COPY classifier/ /classifier/
COPY requirements.txt /
# TODO set the working directory
WORKDIR /
# TODO: update all the Linux packages
RUN apt update
# TODO: install dependencies like git, ibglib2.0-0, and more!
RUN apt install -y git
RUN apt-get install -y libglib2.0-0
RUN pip install -r requirements.txt
# TODO: expose a port (5000 is a popular choice)
EXPOSE 5000
# TODO: run the app locally using uvicorn 
    # (make sure to use the same port!) and also set --workers equal to 1
ENTRYPOINT uvicorn app.main:app --host 0.0.0.0 --port 5000 --workers 1

