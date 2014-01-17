require 'spec_helper'

describe "Blog" do
	subject { page }
	
	let!(:blog) { Blog.create(contents: "Larem ipsum crossed the road",
														title: "Larem ipsum", tags:"[comedy, latin]") }
	
	
	describe "blog page" do
		before { visit blogs_path }
		
		it { should have_content("Larem ipsum crossed the road") }
		it { should have_content("Blog") }
		it { should have_content("Larem ipsum") }
		it { should have_content("comedy") }
		it { should have_content("latin") }
	end
end