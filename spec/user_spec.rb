require 'spec_helper'
require 'rails_helper'

describe User do
  it { should have_valid(:first_name).when('Bob', 'Amanda') }
  it { should have_valid(:last_name).when('Smith', 'Doe') }
end

describe "#admin?" do
  it "is not an admin if the role is not admin" do
    user = FactoryGirl.create(:user, role: "member")
    expect(user.admin?).to eq(false)
  end

  it "is an admin if the role is admin" do
    user = FactoryGirl.create(:user, role: "admin")
    expect(user.admin?).to eq(true)
  end
end
