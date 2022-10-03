require "spec_helper"
require "rails_helper"

describe ApplicationController do
  before { @user = User.new(email: "user@example.com",
    password: "foobar", password_confirmation: "foobar"
    ) }

subject { @user }

  describe "user_signed_in?" do
    before { @user.password != nil }
    it { should be_valid }
  end

end