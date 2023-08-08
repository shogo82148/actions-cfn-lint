FROM alpine:3.18.3

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add python3 py3-pip git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.14.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
