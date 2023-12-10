.PHONY: requirements
requirements:
	docker build -t actions-cfn-lint .
	docker run --rm -v ${PWD}:/actions-cfn-lint --entrypoint '' actions-cfn-lint \
		sh -c 'pip install --upgrade cfn-lint && pip freeze > /actions-cfn-lint/requirements.txt'
