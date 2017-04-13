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

  describe "GET /api/v1/items/:id" do
    it "returns JSON for the item" do
      item_one = Fabricate(:item, name: "item one")
      item_two = Fabricate(:item, name: "item two")

      get "/api/v1/items/#{item_one.id}"

      expect(response).to be_success

      item_json = JSON.parse(response.body)
      expect(item_json["id"]).to eq(item_one.id)
      expect(item_json["name"]).to eq("item one")
      expect(item_json["description"]).to be_truthy
      expect(item_json["name"]).to_not eq("item two")
    end
  end


  describe "DELETE /api/v1/items/:id" do
    it "deletes the record and renders a 204" do
      item_one = Fabricate(:item, name: "item one")
      item_two = Fabricate(:item, name: "item two")

      delete "/api/v1/items/#{item_one.id}"

      expect(response).to be_success
      expect(response.status).to eq(204)
      expect(Item.find(item_two)).to be_truthy
    end
  end
end
