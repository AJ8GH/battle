feature 'Entering player names' do
  scenario 'gives a form for players to input names' do
    visit '/'
    fill_in :player_1_name, with: 'Frank'
    fill_in :player_2_name, with: 'Abigail'
    click_button 'Submit Player Names'
    expect(page).to have_content 'Frank vs. Abigail'
  end
end
