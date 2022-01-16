require_relative '../french_ssn'

describe '#french_ssn_info' do
  it 'returns an error message for an invalid SSN' do
    actual = french_ssn_info('123')
    expected = 'The number is invalid'
    expect(actual).to eq(expected)
  end

  it 'returns the correct description for a valid SSN' do
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expected = 'a male, born in December, 1984 in Seine-Maritime'
    expect(actual).to eq(expected)
  end
end
