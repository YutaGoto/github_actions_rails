workflow "Main workflow" {
  on = "push"
  resolves = ["Rspec"]
}

action "Rspec" {
  uses = "./"
}
