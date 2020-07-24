class Price_calculator
  def initialize
    @pricing_table = {  
      "milk" => {  
        "price" => 3.97, 
        "sale" => { "qun" => 2, "cost" => 5 }
        },
      "bread" => { 
        "price" => 2.17, 
        "sale" => { "qun" => 3, "cost" => 6 }
      },
      "banana" => { 
        "price" => 0.99 
      },
      "apple" => { 
        "price" => 0.89
      }
    }
  end
end