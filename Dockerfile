FROM python:3.12.1-alpine3.19

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.16.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
