require 'rails_helper'

feature 'reviewing' do

  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so, so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so, so')
  end

  scenario 'that reviews get deleted if the restaurant gets deleted' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so, so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Delete KFC'
    expect(Review.all.any?).to be false
  end

  describe Review, :type => :model do

    it "is invalid if the rating is more than 5" do
      review = Review.new(rating: 10)
      expect(review).to have(1).error_on(:rating)
    end

  end

end
