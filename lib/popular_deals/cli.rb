#CLI Controller
class PopularDeals::CLI

  attr_accessor :product_url

  def call
    list_deals
    menu
  end

  def list_deals
    puts "Today's popular deals are:"
      @deals = PopularDeals::NewDeals.new_deals
      @deals.each do |info|
        info.each.with_index(1) do |deal, i|
          puts "#{i}. #{deal.title} - deal popularity: #{deal.deal_rating}."
        end
     end
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of deal you would like more info on or type Exit".light_blue
      puts ""
        input = gets.strip.downcase
        puts ""
        if input.to_i > 0 && input.to_i <= 20
          puts ""
          puts "-----------------------------------------------------------------------------------------------------------"
          puts "Please see below details of deal no. #{input}".yellow.underline
            disply_deal(input, product_url)
        elsif input == "list"
          list_deals
        elsif input == "exit"
          goodbye
        else
          puts "Don't understand your command. Type list to see the list or exit".colorize(:color => :white, :background => :red)
          puts ""
        end
    end
  end

  def disply_deal(input, product_url)
    @deal = PopularDeals::NewDeals.deal_page(input, product_url)
    keys = @deal.keys
    puts ""
    puts "Deal:".yellow
    puts "#{@deal[keys[0]]}"
    puts ""
    puts "Description:".yellow
    puts "#{@deal[keys[1]]}"
    puts ""
    puts "To lock this deal, please visit:".yellow
    puts "#{@deal[keys[2]]}"
    puts "-----------------------------------------------------------------------------------------------------------"
    puts ""
  end

  def goodbye
    puts ""
    puts "Come back again for more deals. Have a great day!".light_blue
    puts ""
  end

end
