class Store
  attr_reader :name, :city, :distance, :phone_number, :store_type
  def initialize(data)
    @name = data[:name]
    @city = data[:city]
    @distance = data[:distance]
    @phone_number = data[:phone_number]
    @store_type = data[:store_type]
  end

  def self.find_by_zipcode(zipcode)
  end
end
