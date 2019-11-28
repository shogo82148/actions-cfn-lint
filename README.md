# GitHub Action for CloudFormation Linter with reviewdog


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
