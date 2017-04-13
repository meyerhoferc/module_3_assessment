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
    results = store_service.get_by_zipcode(zipcode)
    total_stores = results[:total_count]
    stores = results[:stores].map do |store|
      Store.new(name: store[:name],
                store_type: store[:storeType],
                city: store[:city],
                distance: store[:distance],
                phone_number: store[:phone])
    end
    {stores: stores, total: total_stores}
  end
end
