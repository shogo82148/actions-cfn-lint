.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint alpine:3.14.0 \
		sh -c 'apk --no-cache add python3 py3-pip git && pip install --upgrade pip urllib3 && pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
