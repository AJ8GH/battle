feature 'switching turns' do
  scenario 'player 2 attacks and inflicts damage' do
    sign_up_and_play
    2.times { attack_and_click_ok }
    expect(page).not_to have_content 'Frank: 100 HP'
    expect(page).to have_content 'Fank: 90 HP'
  end
end
