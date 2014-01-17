require 'spec_helper'

describe Blog do
  before { 
		@blog = Blog.new(contents: "Larem ipsum crossed the road",
														title: "Larem ipsum", tags:"[comedy, latin]")
	}
	
	subject { @blog }
	
	it { should be_valid }
	it { should respond_to(:contents) }
	it { should respond_to(:title) }
	it { should respond_to(:tags) }
end
