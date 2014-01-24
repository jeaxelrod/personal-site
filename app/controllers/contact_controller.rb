class ContactController < ApplicationController

	def new
		@message = Message.new
	end
	
	def create
		@message = Message.new(params[:message])
		if @message.valid?
			ContactMailer.send_message(@message).deliver
			flash[:notice] = "Thank you for getting in touch!"
			redirect_to contact_path
		else
			render 'new'
		end
	end
end