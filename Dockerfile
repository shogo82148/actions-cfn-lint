FROM python:3.12.5-alpine3.20

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.20.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
