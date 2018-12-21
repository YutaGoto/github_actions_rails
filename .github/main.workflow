workflow "Main workflow" {
  on = "push"
  resolves = ["Rspec"]
}

action "Rspec" {
  uses = "./.github/rspec-action"
  runs = ".github/rspec-action/entrypoint.sh"
}
