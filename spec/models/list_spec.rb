require "spec_helper"

describe List do
  subject { List.new(:name => 'Groceries') }
  
  it { should be_valid }
  it do
    subject.name = nil
    should_not be_valid
  end
end
