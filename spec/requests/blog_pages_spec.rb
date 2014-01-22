require 'spec_helper'

describe "Blog" do
	subject { page }
	
	let!(:blog) { Blog.create(contents: "Larem ipsum crossed the road",
														title: "Larem ipsum", tags:"comedy, latin") }
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
				fill_in 'Title', with: "Dictionaries"
				fill_in 'Tags', with: "dictionary, reference"
				click_button 'Create Blog'
			end
			
			it { should have_content("There is a large American heritage dictionary") }
			it { should have_content("Dictionaries") }
			it { should have_content("dictionary, reference") }
		end
		describe "editing blog post" do
			before do
				visit blogs_path
				click_link 'Edit'
				fill_in 'Contents' , with: "I use a windows computer"
				fill_in 'Title', with: "My Computer"
				fill_in 'Tags', with: 'Computers'
				click_button 'Update Blog'
			end
			
			it { should have_content("I use a windows computer") }
			it { should have_content("My Computer") }
			it { should have_content("computers") }
		end
		
		describe "and then deleting blog post" do
			before do
				visit blogs_path
				click_link "Delete"
			end
			
			it { should have_content("Blog") }
			it { should_not have_content("There is a large American heritage dictionary") }
			it { should_not have_content("Dictionaries") }
			it { should_not have_content("dictionary, reference") }
		end
	end		
	
	describe "blog tags" do
		let!(:blog2) { Blog.create(title: "Uncle Grandpa", tags: "comedy, cartoons",
															contents: "This show is really random") }
		let!(:blog3) { Blog.create(title: "Marshmallows", tags: "food", 
															contents: "They taste good when roasted over a fire") }
		before do
			visit blogs_path
			first('.tags').click_link 'comedy'
		end
		
		it { should have_content("Uncle Grandpa") }
		it { should have_content("Larem ipsum") }
		it { should_not have_content("Marshmallows") } 
	end
end