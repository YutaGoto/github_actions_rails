workflow "Main workflow" {
  on = "push"
  resolves = ["git.master"]
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build -f Dockerfile.test -t ci-$GITHUB_SHA:latest ."
  secrets = ["GITHUB_TOKEN"]
}

action "Rspec" {
  uses = "actions/docker/cli@master"
  needs = ["Build"]
  args = "run ci-$GITHUB_SHA:latest rspec"
  secrets = ["GITHUB_TOKEN"]
}

action "git.master" {
  uses = "actions/bin/filter@master"
  needs = ["Rspec"]
  args = "branch master"
  secrets = ["GITHUB_TOKEN"]
}
