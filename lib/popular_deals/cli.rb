#CLI Controller
class PopularDeals::CLI
  BASE_URL = "https://slickdeals.net/deals/"
  PAGE2_URL = "https://slickdeals.net/deals/?page=2&sort=recent"
  PAGE3_URL = "https://slickdeals.net/deals/?page=3&sort=recent"
  PAGE4_URL = "https://slickdeals.net/deals/?page=4&sort=recent"
  PAGE5_URL = "https://slickdeals.net/deals/?page=5&sort=recent"
  attr_accessor :product_url
  #BROWSER=(/usr/local/bin/firefox-bin -new-tab '%s':/usr/local/bin/google-chrome-stable)

  def call
    select_list_of_deals
    list_deals
    menu
    #goodbye
  end

  def select_list_of_deals
    puts ""
    puts "Which list of the deals would you like to see?".upcase.cyan.bold
    puts "Type 1 for the first list of 1-20 deals.".yellow
    puts "Type 2 for the second list of 21-40 deals.".yellow
    puts "Type 3 for the third list of 41-60 deals.".yellow
    puts "Type 4 for the fourth list of 61-80 deals.".yellow
    puts "Type 5 for the fifth list of 81-100 deals.".yellow
    puts ""
    input = gets.strip.to_i
    case input
    when 1
      @deals = @deals = PopularDeals::NewDeals.scrap_slickdeals(BASE_URL)
      puts ""
      puts "---------- Deal list #{input} - #{input+19} ----------"
      puts ""
    when 2
      @deals = @deals = PopularDeals::NewDeals.scrap_slickdeals(PAGE2_URL)
      puts ""
      puts "---------- Deal list #{input} - #{input+19} ----------"
      puts ""
    when 3
      @deals = @deals = PopularDeals::NewDeals.scrap_slickdeals(PAGE3_URL)
      puts ""
      puts "---------- Deal list #{input} - #{input+19} ----------"
      puts ""
    when 4
      @deals = @deals = PopularDeals::NewDeals.scrap_slickdeals(PAGE4_URL)
      puts ""
      puts "---------- Deal list #{input} - #{input+19} ----------"
      puts ""
    when 5
      @deals = @deals = PopularDeals::NewDeals.scrap_slickdeals(PAGE5_URL)
      puts ""
      puts "---------- Deal list #{input} - #{input+19} ----------"
      puts ""
    else
      puts "Don't understand that command"
      select_list_of_deals
    end
    @deals
  end

  def list_deals
    # puts ""
    # puts "Today's popular deals are:".upcase.yellow
    # puts ""

      #binding.pry
       @deals.each.with_index(1) do |deal, i|
         if i < 10
           puts "#{i}. #{deal.title}".cyan.bold
           puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "   ")
           puts "Deal value - #{deal.price}".gsub(/^/, "   ")
           puts "#{deal.posted}".gsub(/^/, "   ")
           puts ""
         elsif i >= 10
           puts "#{i}. #{deal.title}".cyan.bold
           puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
           puts "Deal value - #{deal.price}".gsub(/^/, "    ")
           puts "#{deal.posted}".gsub(/^/, "    ")
           puts ""
         end
      #   info.each.with_index(1) do |deal, i|
      #       if i < 10
      #         puts "#{i}. #{deal.title}".cyan.bold
      #         puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "   ")
      #         puts "Deal value - #{deal.price}".gsub(/^/, "   ")
      #         puts "#{deal.posted}".gsub(/^/, "   ")
      #         puts ""
      #     elsif i >= 10
      #       puts "#{i}. #{deal.title}".cyan.bold
      #       puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
      #       puts "Deal value - #{deal.price}".gsub(/^/, "    ")
      #       puts "#{deal.posted}".gsub(/^/, "    ")
      #       puts ""
      #     end
      #   end
     end
  end

  def menu
    input = nil
    while input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit.".light_blue.bold
      puts ""
        input = gets.strip.downcase
        puts ""
        #unless input == "exit"
          if input.to_i > 0 && input.to_i <= 20
            puts ""
            puts "-----------------------------------------------------------------------------------------------------------"
            puts ""
            puts "Please see below details of deal no. #{input}".upcase.cyan.bold
              disply_deal(BASE_URL, input, product_url)
              #open_deal_in_browser
          elsif input == "list"
            list_deals
          elsif input == "select list"
            call
          elsif input == "exit"
            goodbye

          else
            puts "Don't understand your command.".colorize(:color => :white, :background => :red)
            puts "Type 'SELECT LIST' to see available deal lists.".yellow
            puts "Type 'LIST' to see the current deal list.".yellow
            puts "Type 'EXIT' to exit.".yellow
            puts ""
          end
      end
        # if input.to_i > 0 && input.to_i <= 20
        #   puts ""
        #   puts "-----------------------------------------------------------------------------------------------------------"
        #   puts ""
        #   puts "Please see below details of deal no. #{input}".upcase.cyan.bold
        #     disply_deal(BASE_URL, input, product_url)
        #     #open_deal_in_browser
        # elsif input == "list"
        #   list_deals
        # elsif input == "select list"
        #   call
        # elsif input == "exit"
        #   goodbye
        #   break
        # else
        #   puts "Don't understand your command. Type select list to see available deal lists, type list to see the current deal list or exit".colorize(:color => :white, :background => :red)
        #   puts ""
        # end
    #end
  end

  # def open_deal_in_browser
  #   uri = "http://www.ruby-lang.org"
  #   Launchy.open( uri ) do |exception|
  #     puts "Attempted to open #{uri} and failed because #{exception}"
  #   end
  # end

  def disply_deal(base_url, input, product_url)
    @deal = PopularDeals::NewDeals.deal_page(BASE_URL, input, product_url)
    keys = @deal.keys
    puts ""
    puts "DEAL:".magenta.bold.gsub(/^/, "    ")
    puts "#{@deal[keys[0]]}".gsub(/^/, "    ")
    puts ""
    puts "Description:".upcase.magenta.bold.gsub(/^/, "    ")
    puts "#{@deal[keys[1]]}".gsub(/^/, "    ")
    puts ""
    if @deal[keys[2]].nil?
      puts "To lock this deal, please visit:".upcase.magenta.bold.gsub(/^/, "    ")
      puts "#{product_url}".gsub(/^/, "    ")
    else
      puts "To lock this deal, please visit:".upcase.magenta.bold.gsub(/^/, "    ")
      puts "#{@deal[keys[2]]}".gsub(/^/, "    ")
    end
    puts ""
    puts "-----------------------------------------------------------------------------------------------------------"
    puts ""
  end

  def goodbye
    shopping = ["We could give up shopping but we are not a quitter.", "When in doubt, go shopping.", "I still believe in the Holy Trinity, except now it's Target, Trader Joe's, and IKEA.", "I love shopping. There is a little bit of magic found in buying something new. It is instant gratification, a quick fix.", "If you can not stop thinking about it, Buy it!", "Shopping is cheaper than therapy."]
    line = shopping.sample
    puts ""
    print "#{line}".yellow
    puts "\u{1f609}"
    puts "Come back again for more deals. Have a great day!".yellow
    puts ""
  end

end
