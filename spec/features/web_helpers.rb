# frozen_string_literal: true

def sign_up_and_play
  visit '/'
  fill_in :player_1_name, with: 'Frank'
  fill_in :player_2_name, with: 'Abigail'
  click_button 'Submit'
end

def attack_and_click_ok
  click_button 'Attack'
  click_button 'OK'
end
