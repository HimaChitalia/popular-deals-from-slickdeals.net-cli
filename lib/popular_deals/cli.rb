#CLI Controller
class PopularDeals::CLI

  def call
    puts "Today's popular deals are:"
    PopularDeals::Deals.scrap_slickdeals
  end

end
