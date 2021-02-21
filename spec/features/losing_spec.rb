# frozen_string_literal: true

feature 'losing' do
  scenario 'player 2 reaches 0 HP' do
    allow_any_instance_of(Object).to receive(:rand) { 20 }
    sign_up_and_play
    8.times { attack_and_click_ok }
    click_button 'Attack'
    expect(page).to have_content 'Abigail lost!'
  end
end
