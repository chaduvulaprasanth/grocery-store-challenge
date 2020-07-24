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
    @total = 0
    @save = 0
  end

  def calculate(items)
    items.each{ |item| @order[item.downcase] += 1 if @pricing_table[item.downcase]}

    @order.each do |item, ordered_quanity|

      # if ordered item is in sale and ordered quantity matched sale item quanity
        if @pricing_table[item]["sale"] && ordered_quanity >= @pricing_table[item]["sale"]["qun"] 
  
          # calculating total price
          @total += ((@pricing_table[item]["sale"]["cost"]) + (@pricing_table[item]["price"] * (ordered_quanity - @pricing_table[item]["sale"]["qun"]))) 

          # amount you saved 
          @save += (((@pricing_table[item]["sale"]["qun"]) * @pricing_table[item]["price"]) - (@pricing_table[item]["sale"]["cost"]))

        else
           # calculating total price if ordered item is not in pricing_table
              @total += (@pricing_table[item]["price"] * ordered_quanity)
        end
    end
    puts "Total price : $#{@total.round(2)}"
    puts "You saved $#{@save.round(2)} today."
  end
  end
end

price_calculator = Price_calculator.new
puts "Please enter all the items purchased separated by a comma"
items = gets.chomp.split(",")
price_calculator.calculate(items) if items