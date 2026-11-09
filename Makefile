.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' python:3.15.2-alpine3.24@sha256:a0f2e268f2ce8f3709611a90054ec6a8ae31f6251f5896b8648b9bb99835e30a \
		sh -c 'pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
