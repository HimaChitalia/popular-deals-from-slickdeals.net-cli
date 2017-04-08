class PopularDeals::Scrapper

  def self.scrap_slickdeals(base_url)
    doc = Nokogiri::HTML(open(base_url))
      all_deals = doc.css("div.dealRow")
      all_deals.collect do |one_deal|
      deal = PopularDeals::NewDeals.new
      deal.title = one_deal.css("div.dealTitle a.track-popularDealLink").text.strip
      link = one_deal.css("div.dealTitle a").attribute("href").value
      deal.url = "https://slickdeals.net#{link}"
      deal.deal_rating = one_deal.css("div.ratingCol div.num").text.strip
      deal.price = one_deal.css("div.priceCol div.price").text.strip

      date = one_deal.css("div.dealLinks").first.text.strip
      new_array = date.split
      deal.posted = "#{new_array[0]} #{new_array[1]}"
      deal.save
    end
  end

  def self.deal_page(base_url, input, product_url)
    product_url = PopularDeals::NewDeals.open_deal_page(base_url, input)
    deal = {}
    html = open(product_url)
    doc = Nokogiri::HTML(html)
    data = doc.text.strip
    deal[:name] = doc.css("h1").text.strip
    deal[:discription] = doc.css(".textDescription").text.strip
      if doc.at_css("a#largeBuyNow").nil?
      deal[:purchase] = product_url
    else
      deal[:purchase] = doc.at_css("a#largeBuyNow").attr("href")
    end
   deal
  end

end
