require 'rails_helper'

RSpec.describe "Admin Merchant Show Page" do
  it "displays merchant name " do
    merchant = Merchant.create!(name: 'Chuckin Pucks')
    merchant2 = Merchant.create!(name: 'Daisys Daffodils')

    visit "/admin/merchants"
    click_on(merchant.name)

    expect(current_path).to eq("/admin/merchants/#{merchant.id}")
    expect(page).to have_content(merchant.name)
    expect(page).to_not have_content(merchant2.name)
  end

  it "has form to updates merchant name" do
    merchant = Merchant.create!(name: 'Chuckin Pucks')

    visit "/admin/merchants/#{merchant.id}"
    click_on("Update Information")
    expect(current_path).to eq("/admin/merchants/#{merchant.id}/edit")

    fill_in "Name", with: "Herbert's Emporium"
    click_on("Update Information")
    expect(current_path).to eq("/admin/merchants/#{merchant.id}")
    expect(page).to have_content("Herbert's Emporium")
    expect(page).to have_content('Information has been successfully updated')
  end
end
