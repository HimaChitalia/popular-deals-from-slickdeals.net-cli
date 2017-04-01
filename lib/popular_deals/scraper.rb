class PopularDeals::Scraper
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
    deal.url = "https://slickdeals.net/deals#{link}"
    deal.deal_rating = one_deal.css("div.ratingCol div.num").text.strip
    deal.price = one_deal.css("div.priceCol div.price").text.strip
    date = one_deal.css("div.dealLinks").first.text.strip
    new_array = date.split
    deal.posted = "#{new_array[0]} #{new_array[1]}"
    deal
    #binding.pry
  end
  #
  # def self.scrap_slickdeals
  #   @data = []
  #    doc = Nokogiri::HTML(open("https://slickdeals.net/deals/"))
  #
  #     all_deals = doc.css("div.dealRow")
  #     all_deals.collect do |one_deal|
  #     link = one_deal.css("div.dealTitle a").attribute("href").value
  #     each_deal = {
  #     :title => one_deal.css("div.dealTitle a.track-popularDealLink").text.strip,
  #     :url => "https://slickdeals.net/deals#{link}",
  #     :deal_rating => one_deal.css("div.ratingCol div.num").text.strip,
  #     :price => one_deal.css("div.priceCol div.price").text.strip,
  #     :posted => "today"
  #     #date = .text.strip
  #     #new_array = date.split
  #     #:posted => one_deal.css("div.dealLinks").split(" More info").first(2)
  #     #{}"#{new_array[0]} #{new_array[1]}"
  #     #string
  #   }
  #
  #   @data << each_deal
  #     #binding.pry
  #   end
  #   #binding.pry
  #   @data
  # end


#def self.find(input)


def self.open_deal_page(input)
index = input.to_i - 1
@product_url = nil
dealInfo = @data[index]
 dealInfo.select do |key, value|
    if key == "url"
      @product_url = value
    end
 end
@product_url
end

def self.deal_page
  deal = {}
    html = Nokogiri::HTML(open(@product_url))
    doc = Nokogiri::HTML(html)
    deal[:name] = doc.css(".dealTitle h1").text.strip
    deal[:discription] = doc.css(".textDescription").text.strip
    deal[:purchase] = doc.css("div a.button").attribute("href")
    #end
    deal
    binding.pry
  end
end
# end
# end
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
end
