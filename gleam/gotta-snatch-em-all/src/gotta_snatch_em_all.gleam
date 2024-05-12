import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  let contained = set.contains(collection, card)
  let collection = set.insert(collection, card)
  #(contained, collection)
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let have_my_card = set.contains(collection, my_card)
  let already_have_their_card = set.contains(collection, their_card)
  let is_worth_doing = have_my_card && !already_have_their_card

  let collection =
    collection
    |> set.insert(their_card)
    |> set.delete(my_card)

  #(is_worth_doing, collection)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.unwrap(set.new())
  |> set.to_list()
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), set.union)
  |> set.size()
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(card) { string.starts_with(card, "Shiny ") })
}
