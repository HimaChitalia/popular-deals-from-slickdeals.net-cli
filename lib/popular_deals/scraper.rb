class PopularDeals::Scraper

  attr_accessor :title, :url, :deal_rating, :price, :posted

  # def self.new_deals
  #   self.scrap_deals
  # end
  #
  # def self.scrap_deals
  #   deals = []
  #   deals << self.scrap_slickdeals
  #   deals
  #   #binding.pry
  # end

  def self.scrap_slickdeals
      data = []
     doc = Nokogiri::HTML(open("https://slickdeals.net/deals/"))

      all_deals = doc.css("div.dealRow")
      all_deals.collect do |one_deal|
      each_deal = {
      :title => one_deal.css("div.dealTitle a.track-popularDealLink").text.strip,
      :url => one_deal.css("div.dealTitle a").attribute("href").value,
      :deal_rating => one_deal.css("div.ratingCol div.num").text.strip,
      :price => one_deal.css("div.priceCol div.price").text.strip,
      :posted => "today"
      #date = .text.strip
      #new_array = date.split
      #:posted => one_deal.css("div.dealLinks").split(" More info").first(2)
      #{}"#{new_array[0]} #{new_array[1]}"
      #string
    }

    data << each_deal
      #binding.pry
    end
    #binding.pry
    data
  end
end

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
