require 'rails_helper'

describe StoreService do
  describe "#get_by_zipcode" do
    it "returns JSON for stores in a 25 mile radius" do
      VCR.use_cassette("services/best_buy_stores_by_zipcode") do
        store_service = StoreService.new()
        json_stores = store_service.get_by_zipcode("80202")
        expect(json_stores.count).to eq(10)
      end
    end
  end
end
