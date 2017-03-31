class PopularDeals::Deals
  attr_accessor :title, :url, :rating, :price, :posted

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
