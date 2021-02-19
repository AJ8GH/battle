feature 'attacking' do
  scenario 'player 1 seeing confirmation' do
    sign_up_and_play
    click_button 'Attack'
    expect(page).to have_content 'Frank attacked Abigail!'
  end

  scenario 'reducing player 2 hit points by 10' do
    sign_up_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Abigail: 100 HP'
    expect(page).to have_content 'Abigail: 90 HP'
  end
end
