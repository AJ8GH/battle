feature 'switching turns' do
  scenario 'turn indicators' do
    sign_up_and_play
    expect(page).to have_content "Frank's turn"
  end

  scenario 'turn indicators' do
    sign_up_and_play
    attack_and_click_ok
    expect(page).not_to have_content "Frank's turn"
    expect(page).to have_content "Abigail's turn"
  end
end
