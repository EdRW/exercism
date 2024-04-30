import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) {
  first_letter(name)
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  string.trim(full_name)
  |> string.split(on: " ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let initials1 = initials(full_name1)
  let initials2 = initials(full_name2)
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials1 <> "  +  " <> initials2 <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
