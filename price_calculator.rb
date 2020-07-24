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
    @order = Hash.new(0)
  end

  def calculate(items)
    items.each{ |item| @order[item.downcase] += 1 if @pricing_table[item.downcase]}
  end
end

price_calculator = Price_calculator.new
puts "Please enter all the items purchased separated by a comma"
items = gets.chomp.split(",")
price_calculator.calculate(items) if items