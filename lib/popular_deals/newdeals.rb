class PopularDeals::NewDeals


  attr_accessor :title, :url, :deal_rating, :price, :posted, :name, :discription, :purchase

  def self.new_deals
    self.scrap_deals
  end

  def self.scrap_deals
    deals = []
    deals << self.scrap_slickdeals
    deals
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
    end
  end

  def self.open_deal_page(input)
    index = input.to_i - 1
    @deals = PopularDeals::NewDeals.new_deals
       @deals.each do |info|
           d = info[index]
          @product_url = "#{d.url}"
       end
      @product_url
  end

  def self.deal_page(input, product_url)
    self.open_deal_page(input)
    deal = {}
    html = open(@product_url)
    doc = Nokogiri::HTML(html)
    data = doc.text.strip
    deal[:name] = doc.css("h1").text.strip
    deal[:discription] = doc.css(".textDescription").text.strip
    deal[:purchase] = doc.css("div.detailLeftColumn a.success").attribute("href").value
    deal
  end

end
