#!/bin/sh

export REVIEWDOG_GITHUB_API_TOKEN=$INPUT_GITHUB_TOKEN

if [ -n "$INPUT_CFN_LINT_ARGS" ]; then
    # shellcheck disable=SC2086
    cfn-lint --format parseable $INPUT_CFN_LINT_ARGS > /tmp/out.log
else
    cfn-lint --format parseable "$@" > /tmp/out.log
fi

# shellcheck disable=SC2086
reviewdog \
    -efm='%f:%l:%c:%*[0-9]:%*[0-9]:%t%n:%m' \
    -name="${INPUT_TOOL_NAME:-cfn-lint}" \
    -reporter="${INPUT_REPORTER:-github-pr-check}" \
    -filter-mode="${INPUT_FILTER_MODE:-added}" \
    -fail-on-error="${INPUT_FAIL_ON_ERROR:-0}" \
    -level="${INPUT_LEVEL:-error}" \
    ${INPUT_REVIEWDOG_FLAGS} < /tmp/out.log
