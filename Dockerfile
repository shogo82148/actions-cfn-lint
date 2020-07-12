FROM alpine:3.12.0

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add python3 git && pip3 install --upgrade pip && pip3 install --no-cache -r /requirements.txt

# install reviewdog
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.10.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
