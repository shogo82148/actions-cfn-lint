.PHONY: requirements
requirements:
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' python:3.14.7-alpine3.24@sha256:f2186fc449b8f7aa5897b542777427a21dc77864f271cf4d1646361cf681c2b9 \
		sh -c 'pip install cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
