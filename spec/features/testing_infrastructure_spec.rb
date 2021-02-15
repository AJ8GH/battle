feature 'Testing infrastructure' do
  scenario 'runs app and checks page content' do
    visit('/Battle')
    expect(page).to have_content 'Testing infrastructure working!'
  end
end
