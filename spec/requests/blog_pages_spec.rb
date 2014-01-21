require 'spec_helper'

describe "Blog" do
	subject { page }
	
	let!(:blog) { Blog.create(contents: "Larem ipsum crossed the road",
														title: "Larem ipsum", tags:"[comedy, latin]") }
	let(:admin) { Admin.create(username:"Jim", password:"foobar", 
														password_confirmation: "foobar") }
	
	
	describe "blog page" do
		before { visit blogs_path }
		
		it { should have_content("Larem ipsum crossed the road") }
		it { should have_content("Blog") }
		it { should have_content("Larem ipsum") }
		it { should have_content("comedy") }
		it { should have_content("latin") }
	end
	
	describe "signing as admin" do	
		before do
			visit signin_path
			fill_in 'Username', with: admin.username
			fill_in 'Password', with: admin.password
			click_button 'Log in'
		end
		
		it { should_not have_content('Sign in') }
		
		describe "creating new blog post" do
			before do
				click_link 'New Post'
				fill_in 'Contents', with: "There is a large American heritage dictionary"
				fill_in 'Title', with: "American Heritage Dictionary"
				fill_in 'Tags', with: "dictionary, reference"
				click_button 'Create Blog'
			end
			
			it { should have_content("There is a large American heritage dictionary") }
			it { should have_content("American Heritage Dictionary") }
			it { should have_content("dictionary, reference") }
		end
	end		
		
end