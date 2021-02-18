feature 'Entering player names' do
  scenario 'gives a form for players to input names' do
    sign_up_and_play
    expect(page).to have_content 'Frank vs. Abigail'
  end
end
