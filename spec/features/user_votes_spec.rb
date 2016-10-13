require 'spec_helper'
require 'rails_helper'

feature 'votes on reviews' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:district) { FactoryGirl.create(:district) }
  let!(:review) { FactoryGirl.create(:review, district_id: district.id) }

  scenario 'unathenticated user views total up and down votes' do
    up_vote = Vote.create(vote: true, user_id: user.id, review_id: review.id)

    visit root_path
    click_link district.name

    expect(page).to have_content("1 Upvotes")
    expect(page).to_not have_link("Vote Up")
    expect(page).to have_content(district.name)
    expect(page).to have_content(review.body)
  end

  scenario 'athenticated user can see vote up or down buttons' do
    user_signs_in(user)
    visit root_path
    click_link district.name

    expect(page).to have_link("Vote Up")
    expect(page).to have_content(district.name)
    expect(page).to have_content(review.body)
  end

  scenario 'athenticated user votes can vote up or down for reviews' do
    up_vote = Vote.create(vote: true, user_id: user.id, review_id: review.id)

    user_signs_in(user)
    visit root_path
    click_link district.name

    expect(page).to have_content("1 Upvotes")
    expect(page).to have_link("Vote Up")
    expect(page).to have_content(district.name)
    expect(page).to have_content(review.body)
  end

  scenario 'unathenticated user cannot vote for reviews' do
    up_vote = Vote.create(vote: true, user_id: user.id, review_id: review.id)

    visit root_path
    click_link district.name

    expect(page).to have_content("1 Upvotes")
    expect(page).to_not have_link("Vote Up")
    expect(page).to have_content(district.name)
    expect(page).to have_content(review.body)
  end
end
