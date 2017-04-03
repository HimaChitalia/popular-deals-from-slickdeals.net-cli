#CLI Controller
class PopularDeals::CLI

  attr_accessor :product_url

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Today's popular deals are:"
      @deals = PopularDeals::NewDeals.new_deals
      @deals.each do |info|
        info.each.with_index(1) do |deal, i|
          puts "#{i}. #{deal.title} - rating: #{deal.deal_rating}."
        end
     end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of deal you would like more info on or type Exit"
        input = gets.strip.downcase
        if input.to_i > 0
            disply_deal(input, product_url)
        elsif input == "list"
          list_deals
        else
          "Don't understand your command. Type list to see the list or exit"
        end
    end
  end

  def disply_deal(input, product_url)
    puts "They got me too!"
    @deal = PopularDeals::NewDeals.deal_page(input, product_url)
    keys = @deal.keys
    puts ""
    puts "Deal: #{@deal[keys[0]]}"
    puts "------------------------------------"
    puts ""
    puts "Deal details: #{@deal[keys[1]]}"
    puts "-------------------------------------"
    puts ""
    puts "See deal: #{@deal[keys[2]]}"
    puts "-------------------------------------"
    puts ""

  end

  def goodbye
    puts "Come back again for more deals. Have a great day!"
  end


end
