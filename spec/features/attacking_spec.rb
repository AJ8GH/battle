feature 'attacking' do
  scenario 'player 1 seeing confirmation' do
    sign_up_and_play
    click_button 'Attack'
    expect(page).to have_content 'Frank attacked Abigail!'
  end

  scenario 'reducing player 2 hit points' do
    sign_up_and_play
    attack_and_click_ok
    expect(page).not_to have_content 'Abigail: 100 HP'
    expect(page).to have_content 'Abigail: 90 HP'
  end

  scenario 'player 2 seeing confirmation' do
    sign_up_and_play
    attack_and_click_ok
    click_button 'Attack'
    expect(page).to have_content 'Abigail attacked Frank!'
  end

  scenario 'reducing player 1 hit points' do
    sign_up_and_play
    2.times { attack_and_click_ok }
    expect(page).not_to have_content 'Frank: 100 HP'
    expect(page).to have_content 'Frank: 90 HP'
  end
end
