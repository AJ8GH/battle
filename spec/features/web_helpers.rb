def sign_up_and_play
  visit '/'
  fill_in :player_1_name, with: 'Frank'
  fill_in :player_2_name, with: 'Abigail'
  click_button 'Submit'
end
