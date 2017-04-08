class PopularDeals::NewDeals


  attr_accessor :title, :url, :deal_rating, :price, :posted, :name, :discription, :purchase, :purchase_link, :number
  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.open_deal_page(base_url, input)
    index = input.to_i - 1
    deals = self.all
    product_url = "#{deals[index].url}"
    product_url
  end

  def self.deals
    all_deals = @@all
    deals = []
    all_deals.collect do |deal_info|
      deal_info.number = all_deals.index(deal_info).to_i + 1
      deals << deal_info
    end
    deals
  end

end
