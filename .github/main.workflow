workflow "Main workflow" {
  on = "push"
  resolves = ["Rspec"]
}

action "Rspec" {
  uses = "./"
  runs = ".github/rspec-action/entrypoint.sh"
}
