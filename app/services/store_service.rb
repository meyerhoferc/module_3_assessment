class StoreService
  def get_by_zipcode(zipcode)
    response = HTTParty.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=storeType,name,city,distance,phone&apiKey=#{ENV['API_KEY']}")
    parsed = parse(response)
    {stores: parsed[:stores], total_count: parsed[:total]}
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
