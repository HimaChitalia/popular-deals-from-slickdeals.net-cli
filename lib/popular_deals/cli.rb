#CLI Controller
class PopularDeals::CLI

  #attr_accessor :deals

  def call
    list_deals
    menu
    goodbye
    #PopularDeals::NewDeals.deals
  end

  def list_deals
    puts "Today's popular deals are:"
    #@deals = PopularDeals::NewDeals.new_deals
    #@deals.each.with_index(1) do |deal, i|
      #binding.pry
      @deals = PopularDeals::NewDeals.new_deals
      @deals.each do |info|
        info.each.with_index(1) do |deal, i|
    #     puts "I am checked!"
         puts "#{i}. #{deal.title} - rating: #{deal.deal_rating}."
    #     #puts "#{i}. #{r.title} for #{r.price} with a rating of #{r.deal_rating}"
    #   #puts "#{deal.title} - #{deal.price} - Rating: #{deal.deal_rating}"
    #   # puts "Available for #{deal.price}"
    #   # puts "Rating: #{deal.deal_rating}"
    #   # puts "#{deal.title}"
    #   # puts "Available at "
      end
     end
  end

  def menu
    input = nil
    while input != exit
      puts "Enter the number of deal you would like more info on or type Exit"
        input = gets.strip.downcase
        if input.to_i > 0
          puts @deals[input.to_i - 1]
        elsif input == "list"
          list_deals
        else
          "Don't understand your command. Type list to see the list or exit"
        end
    end
  end

  def goodbye
    puts "Come back again for more deals. Have a great day!"
  end


end
