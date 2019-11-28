#!/bin/sh

export REVIEWDOG_GITHUB_API_TOKEN=$INPUT_GITHUB_TOKEN

cfn-lint --format parseable "$@" \
    | reviewdog \
    -efm='%f:%l:%c:%*[0-9]:%*[0-9]:%t%n:%m' \
    -name="CloudFormation Linter" \
    -reporter="${INPUT_REPORTER}" \
    -level="${INPUT_LEVEL}"
