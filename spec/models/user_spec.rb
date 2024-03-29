require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :profilename }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it {should have_many(:articles).dependent(:destroy)}
  it {should have_many(:comments).dependent(:destroy)}
end
