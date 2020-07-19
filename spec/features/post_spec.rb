feature 'post message' do
  scenario 'submitting a post' do
    visit('/')
    fill_in :peep, with: 'good morning'
    click_button 'Submit'
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM chitter WHERE peep = 'good morning'")
    expect(result.ntuples).to eq(1)
    expect(page).to have_content 'good morning'
  end
end
