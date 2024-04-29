import gleam/int

// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() -> Int {
  40
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(mins_in_oven: Int) -> Int {
  int.max(0, expected_minutes_in_oven() - mins_in_oven)
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(num_layers: Int) -> Int {
  num_layers * 2
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(num_layers: Int, mins_in_oven: Int) -> Int {
  preparation_time_in_minutes(num_layers) + mins_in_oven
}

// Please define the alarm function
pub fn alarm() {
  "Ding!"
}
