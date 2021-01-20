.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint alpine:3.13 \
		sh -c 'apk --no-cache add python3 py3-pip git && pip install --upgrade pip && pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
