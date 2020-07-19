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
end
