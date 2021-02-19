feature 'losing' do
  scenario 'player 2 reaches 0 HP' do
    sign_up_and_play
    18.times { attack_and_click_ok }
    click_button 'Attack'
    expect(page).to have_content 'Abigail lost!'
  end
end
