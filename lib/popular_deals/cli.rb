#CLI Controller
class PopularDeals::CLI

  attr_accessor :product_url

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

  # def open_deal_page(input)
  #   index = input.to_i - 1
  #   @deals = PopularDeals::NewDeals.new_deals
  #      @deals.each do |info|
  #          d = info[index]
  #         @product_url = "#{d.url}"
  #      end
  #      @product_url.to_s
  #      puts "They got me!"
  # end

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

    #puts "#{@deal}"
    # @deal.each do |key, info|
    #   puts "#{info}"
      # puts "Deal: #{info[1]}"
      # puts "Deal details: #{info[3]}"
      #puts "#{info}"
      # info.each do |d|
      #   puts "#{d[0]}#{d[1]}#{d[2]}"
        #d
  #     puts "I am checked!"
       #puts "#{d.name}."
  #     #puts "#{i}. #{r.title} for #{r.price} with a rating of #{r.deal_rating}"
  #   #puts "#{deal.title} - #{deal.price} - Rating: #{deal.deal_rating}"
  #   # puts "Available for #{deal.price}"
  #   # puts "Rating: #{deal.deal_rating}"
  #   # puts "#{deal.title}"
  #   # puts "Available at "
    #end
  #  end #{info.discription}"
      # puts "To get this deal, visit: #{info.purchase}"
    end
    #   deal.each do |info|
    #  puts "I am checked!"
    #     puts "#{info}."
     #puts "#{i}. #{deal.title} - rating: #{deal.deal_rating}."
#     #puts "#{i}. #{r.title} for #{r.price} with a rating of #{r.deal_rating}"
#   #puts "#{deal.title} - #{deal.price} - Rating: #{deal.deal_rating}"
#   # puts "Available for #{deal.price}"
#   # puts "Rating: #{deal.deal_rating}"
#   # puts "#{deal.title}"
#   # puts "Available at "
  #end

    #end
  #end

  # def disply_deal(input)
  #   @deals = PopularDeals::NewDeals.new_deals
  #   @deals.each do |info|
  #       d = info[input.to_i - 1]
  #      puts "#{d.title}."
  #   end
  # end

  def goodbye
    puts "Come back again for more deals. Have a great day!"
  end


end
