class PopularDeals::NewDeals

  attr_accessor :title, :url, :deal_rating, :price, :posted

  def self.new_deals
    self.scrap_deals
  end

  def self.scrap_deals
    deals = []
    deals << self.scrap_slickdeals
    deals
    #binding.pry
  end

  def self.scrap_slickdeals
    doc = Nokogiri::HTML(open("https://slickdeals.net/deals/"))

      all_deals = doc.css("div.dealRow")
      all_deals.collect do |one_deal|
      deal = self.new
      deal.title = one_deal.css("div.dealTitle a.track-popularDealLink").text.strip
      link = one_deal.css("div.dealTitle a").attribute("href").value
      deal.url = "https://slickdeals.net#{link}"
      deal.deal_rating = one_deal.css("div.ratingCol div.num").text.strip
      deal.price = one_deal.css("div.priceCol div.price").text.strip

      date = one_deal.css("div.dealLinks").first.text.strip
      new_array = date.split
      deal.posted = "#{new_array[0]} #{new_array[1]}"
      deal
      #binding.pry
    end
    #binding.pry
  end

  def self.open_deal_page(input)
    index = input.to_i - 1
    @deals = PopularDeals::NewDeals.new_deals
       @deals.each do |info|
           d = info[index]
          @product_url = "#{d.url}"
       end
      puts "#{@product_url}"

  end

  def self.deal_page(input, product_url)
    self.open_deal_page(input)
    #puts "#{@product_url}"
  deal = {}
    html = open(@product_url)
    puts "Ooppps"
    doc = Nokogiri::HTML(html)
    data = doc.text.strip
    puts "#{data}"
    deal[:name] = doc.css(".dealTitle h1").text.strip
    deal[:discription] = doc.css(".textDescription").text.strip
    deal[:purchase] = doc.css("div a.button").attribute("href").value
    #end
    deal
    #binding.pry
  end
end
#end

#deal = doc.css("div.dealRow").first
#title = deal.css("div.dealTitle a.track-popularDealLink").text - works
#url= deal.css("div.dealTitle a").attribute("href").value -works
#deal_rating = deal.css("div.ratingCol div.num").text -works
#price = deal.css("div.priceCol div.price").text -works
#posted = deal.css("div.dealLinks").first.text.strip
#new_string = posted.split
#date = "#{new_string[0]} #{new_string[1]}"

#deal = doc.css("div.dealRow").first
#title = deal.css("div.dealTitle a.track-popularDealLink").text - works
#url= doc.css("div.dealTitle a").first.attribute("href").value -works
#deal_rating = doc.css("div.ratingCol div.num").first.text -works
#price = doc.css("div.priceCol div.price").first.text -works
#posted = doc.css("div.priceCol div.price").first.text
#date = posted..sub /More info.*/, ''
