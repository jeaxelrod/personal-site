require 'spec_helper'

describe Project do
  before {
    @project = Project.new(link:"http://github.com/jeaxelrod", 
													description: "This is project number 1", 
													name:"Folio")
  }
	
	subject { @project }
  
	it { should be_valid }
	it { should respond_to(:link) }
	it { should respond_to(:description) }
	it { should respond_to(:name) }
end
