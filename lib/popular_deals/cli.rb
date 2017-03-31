#CLI Controller
class PopularDeals::CLI

  attr_accssor :deals

  def call
    list_deals
    goodbye
    #PopularDeals::NewDeals.deals
  end

  def list_deals
    puts "Today's popular deals are:"
    @deals = PopularDeals::NewDeals.deals
  end


end
