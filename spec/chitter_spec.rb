require 'chitter'

describe Chitter do
  describe('#add')do
  it('adds a new peep') do
    Chitter.add('hi')
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM chitter WHERE peep = 'hi'")
    expect(result.ntuples).to eq(1)
  end
end
describe('#all')do
it('lists all peeps') do
  connection = PG.connect(dbname: 'chitter_test')


  connection.exec("INSERT INTO chitter (peep) VALUES ('hello');")
  connection.exec("INSERT INTO chitter (peep) VALUES ('goodbye');")
  connection.exec("INSERT INTO chitter (peep) VALUES ('goodevening');")

  chitter = Chitter.all

expect(chitter).to eq(['hello','goodbye','goodevening'])

end
end























end
