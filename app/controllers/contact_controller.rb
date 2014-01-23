class ContactController < ApplicationController

	def new
		@message = Message.new
	end
	
	def create
		@message = Message.new(params[:message])
		if @message.valid?
			ContactMailer.send_message(@message).deliver
			redirect_to root_url
		else
			flash[:alert] = "Nope"
			render 'new'
		end
	end
end