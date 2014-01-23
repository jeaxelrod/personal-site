class ContactMailer < ActionMailer::Base
	default to: 'axelrod.jeremy@gmail.com'
	
	def send_message(message)
		@message = message
		email_with_name = "#{@message.name} <#{@message.email}>"
		mail( subject: @message.subject, from: email_with_name ) 	
	end
end