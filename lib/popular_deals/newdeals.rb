class PopularDeals::NewDeals


  attr_accessor :title, :url, :deal_rating, :price, :posted, :name, :discription, :purchase, :purchase_link
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

end
