feature 'Testing infrastructure' do
  scenario 'runs app and checks page content' do
    visit('/test')
    expect(page).to have_content 'Testing infrastructure working!'
  end
end
