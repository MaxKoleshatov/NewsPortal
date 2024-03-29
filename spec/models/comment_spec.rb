require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of :body }

  it { should belong_to :article}
  it { should belong_to :user}
end
