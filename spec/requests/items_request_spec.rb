require 'rails_helper'

describe "Items API" do
  describe "GET /api/v1/items" do
    it "returns JSON for all items" do
      items = Fabricate.times(3, :item)

      get "/api/v1/items"

      expect(response).to be_success

      items_json = JSON.parse(response.body)
      expect(items_json.count).to eq(items.count)
      expect(items_json.first["created_at"]).to eq(nil)
    end
  end
end
