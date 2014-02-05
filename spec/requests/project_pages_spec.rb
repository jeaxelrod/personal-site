require 'spec_helper'

describe 'Projects' do
	subject { page }
	
  let!(:project1) { Project.create(link:"http://github.com/jeaxelrod", 
													description: "This is project number 1", 
													name:"Folio") }
  let!(:project2) { Project.create(link:"#", description: "2 is the best",
	                                 name: "Cool Website") }																 
	let(:admin) { Admin.create(username:"Jim", password:"foobar", 
														password_confirmation: "foobar") }
														
  describe "Project page (root)" do
		before { visit root_path }
		
		it { should have_link("The code", href: project1.link) }
		it { should have_content(project1.description) }
		
		it { should have_link("The code", href: project2.link) }
		it { should have_content(project2.description) } 
	
  end
  describe "creating new projects" do
    before {
		  visit signin_path
			fill_in "Username", with: admin.username
			fill_in "Password", with: admin.password
			click_button "Log in"
			
			click_link "New Project"
			fill_in "Name", with: "New Heroku App"
			fill_in "Description", with: "Rails app using heroku"
			fill_in "Link", with: "http://heroku.com"
			click_button "Create Project"
		}
		
		it { should have_content("Rails app using heroku") }
		it { should have_link("The code", href: "http://heroku.com") }
		
  end
		
  describe "editing projects" do
		before {
			visit signin_path
			fill_in "Username", with: admin.username
			fill_in "Password", with: admin.password
			click_button "Log in"
			
			click_link "Edit Project", match: :first
			fill_in "Name", with: "New Heroku App"
			fill_in "Description", with: "Rails app using heroku"
			fill_in "Link", with: "http://heroku.com"
			click_button "Update Project"
		}
		
		it { should have_content("Rails app using heroku") }
		it { should have_link("The code", href: "http://heroku.com") }
		
		it { should have_link("The code", href: project2.link) }
		it { should have_content(project2.description) }
		
  end
	
  describe "destroying projects" do
		before {
		  visit signin_path
			fill_in "Username", with: admin.username
			fill_in "Password", with: admin.password
			click_button "Log in"
			
			click_link "Delete Project", match: :first
		}
		
		it { should_not have_content(project1.description) }
		it { should_not have_link("The code", href: project1.link) }
  end

end