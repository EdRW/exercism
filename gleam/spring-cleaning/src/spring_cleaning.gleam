import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(message) = problem
  message
}

pub fn remove_team_prefix(team: String) -> String {
  let assert "Team " <> team = team
  team
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, team] = string.split(combined, ",")
  #(region, remove_team_prefix(team))
}
