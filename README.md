# GitHub Action for CloudFormation Linter with reviewdog

![build Docker Image](https://github.com/shogo82148/actions-cfn-lint/workflows/build%20Docker%20Image/badge.svg)

This GitHub Action validates CloudFormation yaml/json templates using [CloudFormation Linter](https://github.com/aws-cloudformation/cfn-python-lint/).
It is similar to [cfn-lint-action](https://github.com/marketplace/actions/cfn-lint-action),
but with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve code review experience.

[![github-pr-check sample](https://user-images.githubusercontent.com/1157344/69779599-e084ae80-11eb-11ea-80f8-9350d4d93568.png)](https://github.com/shogo82148/actions-cfn-lint/pull/2/files)

## Inputs

### `github_token`

**Required** reviewdog requires a GitHub token. It should be '`github_token: ${{ secrets.github_token }}`'.

### `level`

Optional. Report level for reviewdog \[`info`, `warning`, `error`\].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command \[`github-pr-check`, `github-pr-review`\].
The default value is `github-pr-check`.

### `args`

Overrides the arguments for cfn-lint.
The default value is `**/*.yaml **/*.yml **/*.json`.

## Outputs

There is no output.

## Example usage

```yaml
- name: minimum example
  uses: shogo82148/actions-cfn-lint@v1
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
```

See [.github/workflows/build.yml](.github/workflows/build.yml) for more examples.
