feature 'switching turns' do
  scenario 'player 2 attacks and inflicts damage' do
    sign_up_and_play
    2.times { attack_and_click_ok }
    expect(page).not_to have_content 'Frank: 100 HP'
    expect(page).to have_content 'Frank: 90 HP'
  end

  scenario 'player 2 gets attack confirmation' do
    sign_up_and_play
    attack_and_click_ok
    click_button 'Attack'
    expect(page).not_to have_content 'Frank attacked Abigail!'
    expect(page).to have_content 'Abigail attacked Frank!'
  end

  scenario 'turn indicators' do
    sign_up_and_play
    expect(page).to have_content "Frank's turn"
  end

  scenario 'player 2 gets attack confirmation' do
    sign_up_and_play
    attack_and_click_ok
    expect(page).not_to have_content "Frank's turn"
    expect(page).to have_content "Abigail's turn"
  end
end
