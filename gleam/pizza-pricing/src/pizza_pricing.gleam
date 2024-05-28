pub type Pizza {
Margherita
Caprese
Formaggio
ExtraSauce(pizza: Pizza)
ExtraToppings(pizza: Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(pizza, 0)
}

fn do_pizza_price(pizza: Pizza, price: Int) -> Int{
  case pizza {
    Margherita -> price + 7
    Caprese -> price + 9
    Formaggio -> price + 10
    ExtraSauce(wrapped_pizza) -> do_pizza_price(wrapped_pizza, price + 1)
    ExtraToppings(wrapped_pizza) -> do_pizza_price(wrapped_pizza, price + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let additional_fee = case order {
    [_] -> 3
    [_, _] -> 2
    _ -> 0
  }

  do_order_price(order, additional_fee)
}

fn do_order_price(order: List(Pizza), price: Int) -> Int {
  case order {
    [] -> price
    [pizza, ..rest] -> {
      let price = pizza_price(pizza) + price
      do_order_price(rest, price)
    }
  }
}
