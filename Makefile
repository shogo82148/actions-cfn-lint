.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' python:3.13.14-alpine3.24@sha256:399babc8b49529dabfd9c922f2b5eea81d611e4512e3ed250d75bd2e7683f4b0 \
		sh -c 'pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
