# read the doc: https://huggingface.co/docs/hub/spaces-sdks-docker
# you will also find guides on how best to write your Dockerfile

FROM python:3.9

RUN useradd -m -u 1000 user

WORKDIR /app

COPY --chown=user ./requirements.txt requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY --chown=user . /app

CMD ["gunicorn", "main:app", "-b", "0.0.0.0:7860"]