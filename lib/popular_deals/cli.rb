#CLI Controller
class PopularDeals::CLI

  attr_accessor :product_url
  #BROWSER=(/usr/local/bin/firefox-bin -new-tab '%s':/usr/local/bin/google-chrome-stable)

  def call
    list_deals
    menu
  end

  def list_deals
    puts ""
    puts "Today's popular deals are:".upcase.yellow
    puts ""
      @deals = PopularDeals::NewDeals.new_deals
      @deals.each do |info|
        info.each.with_index(1) do |deal, i|
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
        end
     end
  end

  def menu
    input = nil
    while input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit".light_blue.bold
      puts ""
        input = gets.strip.downcase
        puts ""

        if input.to_i > 0 && input.to_i <= 20
          puts ""
          puts "-----------------------------------------------------------------------------------------------------------"
          puts ""
          puts "Please see below details of deal no. #{input}".upcase.cyan.bold
            disply_deal(input, product_url)
            #open_deal_in_browser
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

  # def open_deal_in_browser
  #   uri = "http://www.ruby-lang.org"
  #   Launchy.open( uri ) do |exception|
  #     puts "Attempted to open #{uri} and failed because #{exception}"
  #   end
  # end

  def disply_deal(input, product_url)
    @deal = PopularDeals::NewDeals.deal_page(input, product_url)
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
