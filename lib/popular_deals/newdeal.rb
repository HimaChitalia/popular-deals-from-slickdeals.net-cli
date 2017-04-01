class PopularDeals::NewDeal

    attr_accessor :title, :url, :deal_rating, :price, :posted

  @@all = []

  def initialize(deal_hash)
    deal_hash.each do |key, value|
      self.send("#{key}=", value)
    end

    @@all << self

  end

  def self.create_from_collection(deals_array)
    deals_array.each do |deal|
      NewDeal.new(deal)
    end
  end

  def add_deal_details(attributes_hash)
    attributes_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    self
  end

  def self.all
    @@all
  end

end
