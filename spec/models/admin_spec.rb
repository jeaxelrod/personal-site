require 'spec_helper'

describe Admin do
  before { @admin = Admin.new(username:"admin", password: "foobar", 
															password_confirmation: "foobar") }
	subject { @admin }
	
	it { should be_valid }
	it { should respond_to(:username) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
end
