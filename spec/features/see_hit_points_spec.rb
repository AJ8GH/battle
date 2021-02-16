feature 'see hit points' do
  scenario 'it shows 100 hit points for player 1' do
    visit '/'
    fill_in :player_1_name, with: 'Frank'
    fill_in :player_2_name, with: 'Abigail'
    click_button 'Submit'
    expect(page).to have_content "Frank: 100 HP"
  end

  scenario 'it shows 100 hit points for player 1' do
    visit '/'
    fill_in :player_1_name, with: 'Frank'
    fill_in :player_2_name, with: 'Abigail'
    click_button 'Submit'
    expect(page).to have_content "Abigail: 100"
  end
end
