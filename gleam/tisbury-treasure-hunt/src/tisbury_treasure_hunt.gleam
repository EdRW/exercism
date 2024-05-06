import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  treasures
  |> list.filter(fn(treasure) {
    treasure_location_matches_place_location(place.1, treasure.1)
  })
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(desired_treasure_name, desired_treasure_location) = desired_treasure

  case found_treasure, place {
    #("Brass Spyglass", _), #("Abandoned Lighthouse", place_location) -> {
      treasure_location_matches_place_location(
        place_location,
        desired_treasure_location,
      )
    }
    #("Amethyst Octopus", _), #("Stormy Breakwater", _) -> {
      desired_treasure_name == "Crystal Crab"
      || desired_treasure_name == "Glass Starfish"
    }
    #("Vintage Pirate Hat", _), #("Harbor Managers Office", _) -> {
      desired_treasure_name == "Model Ship in Large Bottle"
      || desired_treasure_name == "Antique Glass Fishnet Float"
    }
    _, _ -> False
  }
}
