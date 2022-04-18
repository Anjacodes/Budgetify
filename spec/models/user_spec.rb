require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jenny', email: 'jenny@gmail.com', password: '123456') }

  before(:each) { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email address should be valid' do
    subject.email = 'abc'
    expect(subject).to_not be_valid
  end

  it 'password should have at least 6 characters' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end
end