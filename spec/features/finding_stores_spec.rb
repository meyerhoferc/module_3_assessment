require 'rails_helper'

describe "when a user visits root" do
  it "they can find best buy stores by zipcode" do
    stores = []
    10.times do
      stores << Store.new(
                      name: "Store name",
                      city: "Tucson",
                      distance: "1.1",
                      phone_number: "1112223344",
                      store_type: "store store"
      )
    end
    store_information = {stores: stores, total: 16}
    allow(Store).to receive(:find_by_zipcode).and_return(store_information)
    visit root_path

    fill_in('q', with: "80202")
    click_on "search"

    expect(current_path).to eq(search_path)

    within("#results-message") do
      expect(page).to have_content("16 Total Stores")
    end

    within(".stores") do
      expect(page).to have_content("Store name")
      expect(page).to have_content("Tucson")
      expect(page).to have_content("1.1")
      expect(page).to have_content("1112223344")
      expect(page).to have_content("store store")
    end
  end
end
