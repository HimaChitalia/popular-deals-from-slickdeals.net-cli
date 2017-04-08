class PopularDeals::ListDeals

  def say
    puts "They got me!"
  end

  def self.list1_actions
    deals = PopularDeals::CLI.select_list_of_deals
    deals.each.with_index(1) do |deal, i|
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
    @input = nil
    while @input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit.".light_blue.bold
      puts ""
      @input = gets.strip.downcase
      puts ""
    if @input.to_i > 0 && @input.to_i <= 20
      puts ""
      puts "-----------------------------------------------------------------------------------------------------------"
      puts ""
      puts "Please see below details of deal no. #{@input}".upcase.cyan.bold
        PopularDeals::CLI.disply_deal(BASE_URL, @input, product_url)
        #open_deal_in_browser
    elsif @input == "list"
      PopularDeals::CLI.list_deals
    elsif @input == "select list"
      PopularDeals::CLI.call
      #break
    elsif @input == "exit"
      PopularDeals::CLI.goodbye
    else
      puts "Don't understand your command.".colorize(:color => :white, :background => :red)
      puts "Type 'SELECT LIST' to see available deal lists.".yellow
      puts "Type 'LIST' to see the current deal list.".yellow
      puts "Type 'EXIT' to exit.".yellow
      puts ""
    end
  end
  end

  def self.list2_actions
    deals = PopularDeals::CLI.select_list_of_deals
    deals.each.with_index(21) do |deal, i|
        puts "#{i}. #{deal.title}".cyan.bold
        puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
        puts "Deal value - #{deal.price}".gsub(/^/, "    ")
        puts "#{deal.posted}".gsub(/^/, "    ")
        puts ""
    end
    @input = nil
    while @input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit.".light_blue.bold
      puts ""
      @input = gets.strip.downcase
      puts ""
    if @input.to_i > 20 && @input.to_i <= 40
      puts ""
      puts "-----------------------------------------------------------------------------------------------------------"
      puts ""
      puts "Please see below details of deal no. #{@input}".upcase.cyan.bold
        PopularDeals::CLI.disply_deal(BASE_URL, @input, product_url)
        #open_deal_in_browser
    elsif @input == "list"
      PopularDeals::CLI.list_deals
    elsif @input == "select list"
      PopularDeals::CLI.call
      #break
    elsif @input == "exit"
      PopularDeals::CLI.goodbye
    else
      puts "Don't understand your command.".colorize(:color => :white, :background => :red)
      puts "Type 'SELECT LIST' to see available deal lists.".yellow
      puts "Type 'LIST' to see the current deal list.".yellow
      puts "Type 'EXIT' to exit.".yellow
      puts ""
    end
  end
  end

  def self.list3_actions
    deals = PopularDeals::CLI.select_list_of_deals
    deals.each.with_index(41) do |deal, i|
        puts "#{i}. #{deal.title}".cyan.bold
        puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
        puts "Deal value - #{deal.price}".gsub(/^/, "    ")
        puts "#{deal.posted}".gsub(/^/, "    ")
        puts ""
    end
    @input = nil
    while @input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit.".light_blue.bold
      puts ""
      @input = gets.strip.downcase
      puts ""
    if @input.to_i > 40 && @input.to_i <= 60
        puts ""
        puts "-----------------------------------------------------------------------------------------------------------"
        puts ""
        puts "Please see below details of deal no. #{@input}".upcase.cyan.bold
          PopularDeals::CLI.disply_deal(BASE_URL, @input, product_url)
          #open_deal_in_browser
      elsif @input == "list"
        PopularDeals::CLI.list_deals
      elsif @input == "select list"
        PopularDeals::CLI.call
        #break
      elsif @input == "exit"
        PopularDeals::CLI.goodbye
      else
        puts "Don't understand your command.".colorize(:color => :white, :background => :red)
        puts "Type 'SELECT LIST' to see available deal lists.".yellow
        puts "Type 'LIST' to see the current deal list.".yellow
        puts "Type 'EXIT' to exit.".yellow
        puts ""
      end
    end
  end

  def self.list4_actions
    deals = PopularDeals::CLI.select_list_of_deals
    deals.each.with_index(61) do |deal, i|
        puts "#{i}. #{deal.title}".cyan.bold
        puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
        puts "Deal value - #{deal.price}".gsub(/^/, "    ")
        puts "#{deal.posted}".gsub(/^/, "    ")
        puts ""
    end
    @input = nil
    while @input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit.".light_blue.bold
      puts ""
      @input = gets.strip.downcase
      puts ""
      if @input.to_i > 60 && @input.to_i <= 80
        puts ""
        puts "-----------------------------------------------------------------------------------------------------------"
        puts ""
        puts "Please see below details of deal no. #{@input}".upcase.cyan.bold
          PopularDeals::CLI.disply_deal(BASE_URL, @input, product_url)
          #open_deal_in_browser
      elsif @input == "list"
        PopularDeals::CLI.list_deals
      elsif @input == "select list"
        PopularDeals::CLI.call
        #break
      elsif @input == "exit"
        PopularDeals::CLI.goodbye
      else
        puts "Don't understand your command.".colorize(:color => :white, :background => :red)
        puts "Type 'SELECT LIST' to see available deal lists.".yellow
        puts "Type 'LIST' to see the current deal list.".yellow
        puts "Type 'EXIT' to exit.".yellow
        puts ""
      end
    end
  end

  def self.list5_actions
    deals = PopularDeals::CLI.select_list_of_deals
    deals.each.with_index(81) do |deal, i|
      if i > 100
        puts "#{i}. #{deal.title}".cyan.bold
        puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
        puts "Deal value - #{deal.price}".gsub(/^/, "    ")
        puts "#{deal.posted}".gsub(/^/, "    ")
        puts ""
      else
        puts "#{i}. #{deal.title}".cyan.bold
        puts "Deal rating: #{deal.deal_rating}.".gsub(/^/, "    ")
        puts "Deal value - #{deal.price}".gsub(/^/, "    ")
        puts "#{deal.posted}".gsub(/^/, "    ")
        puts ""
      end
    end
    @input = nil
    while @input != "exit"

      puts ""
      puts "Enter the number of deal you would like more info on or type Exit.".light_blue.bold
      puts ""
      @input = gets.strip.downcase
      puts ""
    if @input.to_i > 80 && @input.to_i <= 100
      puts ""
      puts "-----------------------------------------------------------------------------------------------------------"
      puts ""
      puts "Please see below details of deal no. #{@input}".upcase.cyan.bold
        PopularDeals::CLI.disply_deal(BASE_URL, @input, product_url)
        #open_deal_in_browser
    elsif @input == "list"
      PopularDeals::CLI.list_deals
    elsif @input == "select list"
      PopularDeals::CLI.call
      #break
    elsif @input == "exit"
      PopularDeals::CLI.goodbye
    else
      puts "Don't understand your command.".colorize(:color => :white, :background => :red)
      puts "Type 'SELECT LIST' to see available deal lists.".yellow
      puts "Type 'LIST' to see the current deal list.".yellow
      puts "Type 'EXIT' to exit.".yellow
      puts ""
    end
  end
  end

end
