require 'spec_helper'

describe "Authentication" do
	
	subject { page }
	
	let(:admin) { Admin.create(username:"Jim", password:"foobar", 
														password_confirmation: "foobar") }
	
	describe "visit signin page" do
		before { visit signin_path }
		
		it { should have_content('Sign in') }
		it { should have_content('Username') }
		it { should have_content('Password') }
	end

	describe "signing in with invalid information" do
		before do
			visit signin_path
			fill_in 'Username', with: "Joe"
			fill_in 'Password', with: "foobar"
			click_button "Log in"
		end
		
		it { should have_content('Sign in') }
	end
	
	describe "signing in with valid information" do
		before do
			visit signin_path
			fill_in 'Username', with: admin.username
			fill_in 'Password', with: admin.password
			click_button "Log in"
			visit root_path
		end
		
		it { should have_content("Projects") }
		it { should have_content("Web Developer") }
		it { should have_link("Sign out") }
		
		describe "signing out" do
			before do 
				click_link "Sign out"
				visit root_path
			end
			
			it { should have_content("Projects") }
			it { should have_content("Web Developer") }
			it { should_not have_link("Sign out") }
		end
			
	end
end