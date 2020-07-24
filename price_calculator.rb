require 'terminal-table/import'
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
    @ordered_items_prices = []
    @result_table = []
  end

  def calculate(items)
    items.each{ |item| @order[item.downcase] += 1 if @pricing_table[item.downcase]}

    @order.each do |item, ordered_quanity|

      # if ordered item is in sale and ordered quantity matched sale item quanity
        if @pricing_table[item]["sale"] && ordered_quanity >= @pricing_table[item]["sale"]["qun"] 
  
          # calculating total price
          ordered_item_price = (@pricing_table[item]["sale"]["cost"]) + ((@pricing_table[item]["price"]) * (ordered_quanity - (@pricing_table[item]["sale"]["qun"])))
         
          @result_table << [item, ordered_quanity, ordered_item_price]
          @total += ordered_item_price

          # amount you saved 
          @save += (((@pricing_table[item]["sale"]["qun"]) * (@pricing_table[item]["price"])) - (@pricing_table[item]["sale"]["cost"]))
  
        else
           # calculating total price if ordered item is not in pricing_table
           ordered_item_price = (@pricing_table[item]["price"]) * ordered_quanity
           @result_table << [item, ordered_quanity, ordered_item_price]
           @total += ordered_item_price
        end
    end

    # calling result method to genearte result
    result
  end

  def result
    items_table = table { |t|
      t.headings = "Item", "Quantity", "Price"
      @result_table.each { |row| t << row }
    }
    puts items_table
  puts "\n"
    puts "Total price : $#{@total.round(2)}"
    puts "You saved $#{@save.round(2)} today."
  end
end

price_calculator = Price_calculator.new
puts "Please enter all the items purchased separated by a comma"
items = gets.chomp.split(",")
price_calculator.calculate(items) if items