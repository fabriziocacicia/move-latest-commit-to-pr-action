# Move Latest Commit to PR
A Github Action that removes the latest commit from the history and moves it to a Pull Request

## Usage

```yml
      - uses: actions/checkout@v3
        with:
        fetch-depth: 0
      - name: Move Latest Commit to PR
        uses: fabriziocacicia/move-latest-commit-to-pr-action@0.1.0
```

Without any inputs, the action will create and push a new branch names as the hash of the will be removed, will create a Pull Request (named as the commit message of that commit) based on the new branch and with the `main` branch as base. It will also assign the commit author as assignee of the PR.

### Action inputs

All inputs are **optional**.

| Name | Description | Default |
| --- | --- | --- |
| prTitle | The title of the PR. | The message of the removed commit. |
| prBody | The body of the PR. | The commit $LATEST_COMMIT_HASH has been removed from the repository history and moved to this Pull Request. |
| baseBranch | The base branch of the PR. | `main` |
| headBranch | The name of the branch that will be created and from which the PR will be created. | The hash of the removed commit. |
| assignee | The Github user to which the PR is assigned. | The username of the author of the removed commit. |
