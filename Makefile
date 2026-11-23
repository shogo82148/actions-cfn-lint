.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' python:3.15.2-alpine3.24@sha256:0f9552bb28711333da16915ec146f5e6bb44a7fdac9ced15dc17c2e0206346dd \
		sh -c 'pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
