#!/bin/sh

export REVIEWDOG_GITHUB_API_TOKEN=$INPUT_GITHUB_TOKEN

if [ -n "$INPUT_ARGS" ]; then
    # shellcheck disable=SC2086
    cfn-lint --format parseable $INPUT_ARGS > /tmp/out.log
else
    cfn-lint --format parseable "$@" > /tmp/out.log
fi

reviewdog \
    -efm='%f:%l:%c:%*[0-9]:%*[0-9]:%t%n:%m' \
    -name="CloudFormation Linter" \
    -reporter="${INPUT_REPORTER}" \
    -level="${INPUT_LEVEL}" < /tmp/out.log
