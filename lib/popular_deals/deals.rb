class PopularDeals::Deals

  attr_accessor :title, :url, :deal_rating, :price

  def self.deals
    self.scrap_deals
  end

  def self.scrap_deals
    deals = []
    deals << self.scrap_slickdeals
    deals
  end

  def self.scrap_slickdeals
    doc = Nokogiri::HTML(open("https://slickdeals.net/deals/"))
    deal = doc.css("div.dealRow").first
    binding.pry
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
