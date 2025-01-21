# GitHub Action for CloudFormation Linter with reviewdog

![build Docker Image](https://github.com/shogo82148/actions-cfn-lint/workflows/build%20Docker%20Image/badge.svg)

This GitHub Action validates CloudFormation yaml/json templates using [CloudFormation Linter](https://github.com/aws-cloudformation/cfn-python-lint/).
It is similar to [cfn-lint-action](https://github.com/marketplace/actions/cfn-lint-action),
but with [reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve code review experience.

[![github-pr-check sample](https://user-images.githubusercontent.com/1157344/69779599-e084ae80-11eb-11ea-80f8-9350d4d93568.png)](https://github.com/shogo82148/actions-cfn-lint/pull/2/files)

## Inputs

### `github_token`

**Required** reviewdog requires a GitHub token. The default value is '`${{ secrets.github_token }}`'.

### `tool_name`

Optional. Tool name to use for reviewdog reporter. Useful when running multiple actions with different config.

### `level`

Optional. Report level for reviewdog \[`info`, `warning`, `error`\].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command \[`github-pr-check`, `github-pr-review`\].
The default value is `github-pr-check`.

### `filter_mode`

Optional. Filtering mode for the reviewdog command \[`added`,`diff_context`,`file`,`nofilter`\]. Default is `added`.

### `fail_level`

Optional. Exit with code 1 if it finds at least 1 issue with severity greater than or equal to the givin level. \[`none`,`any`,`info`,`warning`,`error`\]. Default is `none`.

### `reviewdog_flags`

Optional. Additional reviewdog flags. The default is "".

### `cfn_lint_args`

Optional. the arguments for cfn-lint. The default is "".

### `working_directory`

Optional. Directory to run the action on, from the repo root. The default is . ( root of the repository).

## Outputs

There is no output.

## Example usage

```yaml
- name: minimum example
  uses: shogo82148/actions-cfn-lint@v1
  cfn_lint_args: "**/*.yaml **/*.yml **/*.json"
```

See [.github/workflows/test.yml](.github/workflows/test.yml) for more examples.

## Migrate to v1 from v2

- `args` input is removed. use `cfn_lint_args` instead of it.
- the default of `cfn_lint_args` is now `""`. To have the same behavior as v1, please specify `"**/*.yaml **/*.yml **/*.json"`.

## Migrate to v4 from v2 and v3

- `fail_on_error` input is removed. use `fail_level` instead of it.
- the default of `fail_level` is now `none`.
