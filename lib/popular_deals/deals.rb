class PopularDeals::Deals
<<<<<<< HEAD
  attr_accessor :title, :url, :deal_rating, :price
=======
  attr_accessor :title, :url, :deal_rating, :price, :posted
>>>>>>> 02afa8b722fef879f6139c128739bfae9b8699e8

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


#title = doc.css("div.dealTitle a.track-popularDealLink").first.text - works
#url= doc.css("div.dealTitle a").first.attribute("href").value -works
#deal_rating = doc.css("div.ratingCol div.num").first.text -works
#price = doc.css("div.priceCol div.price").first.text -works
