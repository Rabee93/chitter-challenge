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
feature 'list peeps' do
  scenario 'it lists all the peeps' do

    connection = PG.connect(dbname: 'chitter_test')


    connection.exec("INSERT INTO chitter (peep) VALUES ('hello');")
    connection.exec("INSERT INTO chitter (peep) VALUES ('goodbye');")
    connection.exec("INSERT INTO chitter (peep) VALUES ('goodevening');")

    visit('/list')




    expected_order = ['goodevening', 'goodbye', 'hello']
    actual_order = page.all('li').map(&:text)

    expect(actual_order).to eq(expected_order)


  end
  end
