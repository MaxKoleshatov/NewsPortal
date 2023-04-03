require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :announcement }
  it { should validate_presence_of :body }

  it { should belong_to :category}
  it { should belong_to :user}

  it {should have_many(:comments).dependent(:destroy)}
end
