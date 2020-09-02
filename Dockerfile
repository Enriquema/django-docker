FROM python:3.7

ENV PYTHONUNBUFFERED 1
RUN mkdir /mobre

WORKDIR /mobre
COPY . /mobre/

RUN pip install -r requirements.txt

# ttf font
ARG src="./mobre/mobre/static/fonts/Algerian Regular.ttf"
ARG target="/usr/share/fonts"
COPY ${src} ${target}

# refresh system font cache
RUN fc-cache -f -v

CMD ["gunicorn", "-c", "config/gunicorn/conf.py", "--bind", ":8000", "--chdir", "mobre", "mobre.wsgi:application"]
