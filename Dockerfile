FROM python:3.16.0a2-alpine3.24@sha256:a3beb9b3efb6d934a88fb3f2c7b1bc8be40ea75abd1d1366ca8057241364d57d

# install cfn-lint
COPY requirements.txt /requirements.txt
RUN apk --no-cache add git bash && pip install --upgrade pip && pip install --no-cache -r /requirements.txt

# install reviewdog
ENV REVIEWDOG_VERSION=v0.21.3
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ "$REVIEWDOG_VERSION"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
