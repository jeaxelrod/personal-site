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

end