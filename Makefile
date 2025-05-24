.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' python:3.13.3-alpine3.21 \
		sh -c 'pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
