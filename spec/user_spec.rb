require 'spec_helper'
describe User do
  it { should have_valid(:first_name).when('Bob', 'Amanda') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Doe') }
  it { should_not have_valid(:last_name).when(nil, '') }
end
