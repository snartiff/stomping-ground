require 'spec_helper'
require 'rails_helper'
describe User do
  it { should have_valid(:first_name).when('Bob', 'Amanda') }
  it { should have_valid(:last_name).when('Smith', 'Doe') }

end
