.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint alpine:3.11 \
		sh -c 'apk --no-cache add python3 git && pip3 install --upgrade pip && pip3 install cfn-lint && pip3 freeze > /actions-cfn-lint/requirements.txt'
