class Message
	include ActiveModel::Model
	
	attr_accessor :email, :name, :body, :subject
	
	validates_presence_of  :email,:body
	validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
	
end