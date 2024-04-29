import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: health, ..) if health >= 1 -> None
    // BUG: Here it was unclear if players with high-level players
    // with mana value of None should have theirs set to 
    // Some(100) upon revival
    Player(level: level, mana: Some(_), ..) if level >= 10 -> {
      Some(Player(..player, health: 100, mana: Some(100)))
    }
    _ -> Some(Player(..player, health: 100))
  }
}

// BUG: Function returns a Tuple, but tuples haven't been unlocked
// in the learning track yet
pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> {
      let health = int.max(player.health - cost, 0)
      #(Player(..player, health: health), 0)
    }
    Some(current_mana) if current_mana >= cost -> {
      let remaining_mana = Some(current_mana - cost)
      let damage = 2 * cost
      #(Player(..player, mana: remaining_mana), damage)
    }
    _ -> #(player, 0)
  }
}
