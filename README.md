# Move Latest Commit to PR
A Github Action that removes the latest commit from the history and moves it to a Pull Request

## Usage

```yml
      - uses: actions/checkout@v3
        with:
            fetch-depth: 0
      - name: Move Latest Commit to PR
        uses: fabriziocacicia/move-latest-commit-to-pr-action@v0.2.0
```

Without any inputs, the action will create and push a new branch names as the hash of the will be removed, will create a Pull Request (named as the commit message of that commit) based on the new branch and with the `main` branch as base. It will also assign the commit author as assignee of the PR.

### Action inputs

All inputs are **optional**.

| Name | Description | Default |
| --- | --- | --- |
| prTitle | The title of the PR. | The message of the removed commit. |
| prBody | The body of the PR. | The commit $LATEST_COMMIT_HASH has been removed from the repository history and moved to this Pull Request. |
| baseBranch | The base branch of the PR. | The branch of the triggering event (i.e. in case of push, the branch to which the pushed commit belongs to). |
| headBranch | The name of the branch that will be created and from which the PR will be created. It will be suffixed with the hash of the removed commit (i.e. head_branch_name/hash | The hash of the removed commit. |
| assignee | The Github user to which the PR is assigned. | The username of the author of the removed commit. |


## Examples

### Custom head branch
```yml
      - uses: actions/checkout@v3
        with:
            fetch-depth: 0
      - name: Move Latest Commit to PR
        uses: fabriziocacicia/move-latest-commit-to-pr-action@v0.2.0
        with:
            headBranch: removed_commits
```
This will create a new branch named `removed_commits/48fnv479`, where `48fnv479` is the hash of the commit that will be removed.

### Default head branch
```yml
      - uses: actions/checkout@v3
        with:
            fetch-depth: 0
      - name: Move Latest Commit to PR
        uses: fabriziocacicia/move-latest-commit-to-pr-action@v0.2.0
        with:
            headBranch: removed_commits
```
In this case the new branch will be named `48fnv479`, where `48fnv479` is the hash of the commit that will be removed.

### Custom PR body
```yml
      - uses: actions/checkout@v3
        with:
            fetch-depth: 0
      - name: Move Latest Commit to PR
        uses: fabriziocacicia/move-latest-commit-to-pr-action@v0.2.0
        with:
            headBranch: removed_commits
            prBody: |
                  This is the body of the Pull Request.
                  It can be multiline.
```
Notice that it is possible to specify a multiline body for the PR.
