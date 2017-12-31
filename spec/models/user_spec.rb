require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {create :user}


  it "Creates a new user" do
    expect(User.all).to include(user);
  end
end
