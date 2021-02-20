# frozen_string_literal: true

feature 'see hit points' do
  scenario 'it shows 100 hit points for player 1' do
    sign_up_and_play
    expect(page).to have_content 'Frank: 100 HP'
  end

  scenario 'it shows 100 hit points for player 2' do
    sign_up_and_play
    expect(page).to have_content 'Abigail: 100'
  end
end
