FROM alpine:3.11

# install cfn-lint
RUN apk --no-cache add python3 git && pip3 install cfn-lint

# install reviewdog
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.9.17

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
