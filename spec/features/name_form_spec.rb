feature 'Entering player names' do
  scenario 'gives a form for players to input names' do
    visit '/'
    fill_in :player_1_name, with: 'Adam'
    fill_in :player_2_name, with: 'Isaac'
    click_button 'Submit'
    expect(page).to have_content 'Adam vs. Isaac'
  end
end
