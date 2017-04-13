class Store
  attr_reader :name, :city, :distance, :phone_number, :store_type
  def initialize(data)
    @name = data[:name]
    @city = data[:city]
    @distance = data[:distance]
    @phone_number = data[:phone_number]
    @store_type = data[:store_type]
  end

  def self.store_service
    @store_service ||= StoreService.new()
  end

  def self.find_by_zipcode(zipcode)
    store_service.get_by_zipcode(zipcode).map do
      Store.new()
    end
  end
end
