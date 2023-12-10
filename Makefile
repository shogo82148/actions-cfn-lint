.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint python:3.12.1-alpine3.19 \
		sh -c 'apk --no-cache add && pip install --upgrade pip urllib3 && pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
