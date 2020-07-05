feature 'post message' do
  scenario 'submitting a post' do
    visit('/')
    fill_in :peep, with: 'good morning'
    click_button 'Submit'
    expect(page).to have_content 'good morning'
  end
end
