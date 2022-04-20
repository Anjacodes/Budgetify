require_relative '../rails_helper'

RSpec.describe Expense, type: :model do
  subject { Expense.new(name: 'Expense1', amount: 3.99) }

  before(:each) { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
