FROM python:3.14.7-alpine3.24@sha256:c6ead215bfd31f1e433d968853b7a769989117115b728874824e6c0a27cb96fc

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
ENV REVIEWDOG_VERSION=v0.21.0
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ "$REVIEWDOG_VERSION"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
