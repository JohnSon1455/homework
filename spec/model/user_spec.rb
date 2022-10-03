require "spec_helper"
require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:tasks).dependent(:destroy) }
  it { should have_many(:buckets).dependent(:destroy) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
