require 'rails_helper'

# As a merchant,
# When I visit my merchant items index page ("merchant/merchant_id/items")
# I see a list of the names of all of my items
# And I do not see items for any other merchant
RSpec.describe 'Merchant Items index page' do
  before(:each) do
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    @merchant_2 = Merchant.create!(name: 'Cummings-Thiel')
    @item_1 = @merchant_1.items.create!(name: 'tem Qui Esse', description: 'nihil autem', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Item Autem Minima', description: 'Cumque consequuntu', unit_price: 67076)
    @item_3 = @merchant_2.items.create!(name: 'Item Ea Voluptatum', description: 'Sunt officia', unit_price: 32301)
  end

  it 'shows items specific to merchant' do
    visit "merchants/#{@merchant_1.id}/items"
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
    expect(page).to_not have_content(@item_3.name)

    visit "merchants/#{@merchant_2.id}/items"
    expect(page).to_not have_content(@item_1.name)
    expect(page).to_not have_content(@item_2.name)
    expect(page).to have_content(@item_3.name)

  end
end
