#!/bin/bash

export REVIEWDOG_GITHUB_API_TOKEN=$INPUT_GITHUB_TOKEN

shopt -s globstar nullglob

# enable debug if INPUT_RUNNER_DEBUG is set
if [[ ${RUNNER_DEBUG:-} = '1' ]]; then
    set -x
fi

cfn-lint --version

cd "${GITHUB_WORKSPACE}/${INPUT_WORKING_DIRECTORY}" || exit 1

# INPUT_CFN_LINT_ARGS is intentionally not quoted:
# shellcheck disable=SC2086
cfn-lint --format parseable --non-zero-exit-code none $INPUT_CFN_LINT_ARGS > /tmp/out.log || exit 1 

# show out.log if debug is enabled
if [[ ${RUNNER_DEBUG:-} = '1' ]]; then
    cat /tmp/out.log >&2
fi

git config --global --add safe.directory "${PWD}" || exit 1

# INPUT_REVIEWDOG_FLAGS is intentionally not quoted:
# shellcheck disable=SC2086
reviewdog \
    -efm='%f:%l:%c:%*[0-9]:%*[0-9]:%t%n:%m' \
    -name="${INPUT_TOOL_NAME}" \
    -reporter="${INPUT_REPORTER}" \
    -filter-mode="${INPUT_FILTER_MODE}" \
    -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
    -level="${INPUT_LEVEL}" \
    ${INPUT_REVIEWDOG_FLAGS} < /tmp/out.log
exit_code=$?

exit $exit_code
