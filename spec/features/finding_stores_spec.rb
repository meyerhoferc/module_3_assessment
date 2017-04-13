require 'rails_helper'

describe "when a user visits root" do
  it "they can find best buy stores by zipcode" do
    visit root_path

    fill_in('q', with: "80202")
    click_on "search"

    expect(current_path).to eq(search_path)

    within(".results-message") do
      expect(page).to have_content("16 Total Stores")
    end

    within(".stores-1") do
      expect(page).to have_content("ENTIRE NAME")
      expect(page).to have_content("Denver")
      expect(page).to have_content("Distance: ")
      expect(page).to have_content("Phone Number: ")
      expect(page).to have_content("Store Type: ")
    end
  end
end
