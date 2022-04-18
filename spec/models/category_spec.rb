require_relative '../rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'Category1', icon: 'www.sampleicon.com') }

  before(:each) { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end