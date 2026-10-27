.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' python:3.14.10-alpine3.24@sha256:cfe4b5079e5852da965ae14f74a6e2b137ece05b918d27c575fb70de3c85db2b \
		sh -c 'pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
