require 'rails_helper'

describe Store, type: :model do
  describe "#find_by_zipcode" do
    it "returns a list of 10 Store objects" do
      stores = []
      10.times do
        stores << Store.new(
                          name: "Actual Store",
                          city: "Denver",
                          distance: "0.25",
                          phone_number: "1112223344",
                          store_type: "store-store"
                        )
      end

      allow(Store).to receive(:find_by_zipcode).and_return(stores)

      found_stores = Store.find_by_zipcode("80202")
      expect(found_stores.count).to eq(10)
      expect(found_stores.first.class).to eq(Store)
      expect(found_stores.first.name).to eq("Actual Store")
      expect(found_stores.first.city).to eq("Denver")
      expect(found_stores.first.phone_number).to eq("1112223344")
      expect(found_stores.first.store_type).to eq("store-store")
    end
  end
end
