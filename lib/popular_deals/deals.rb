class PopularDeals::Deals
  attr_accessor :title, :url, :deal_rating, :price, :posted

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
    binding.pry
  end
end

#title = doc.css("div.dealTitle a.track-popularDealLink").first.text
#url= doc.css("div.dealTitle a").attribute("href").value
#deal_rating = doc.css("div.ratingCol div.num").text
#price = doc.css("div.priceCol div.price").text
#posted = doc.css("div.dealLinks").text.
#
