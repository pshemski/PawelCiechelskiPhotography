class MessagesController < ApplicationController
	before_action :set_image, only: [:new]
	
  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params) 
    if @message.valid?
      MessageMailer.new_message_notification(@message).deliver
      flash[:notice] = "Thank you for your message. We will get back to you soon."
      redirect_to contact_path
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

  private

  def message_params
  	params.require(:message).permit(:name, :email, :message)
  end

  def set_image
		images = Image.where(front_page_image: true)
  	landscape_images = []
		images.each do |img|
			landscape_images << img if img.image.is_landscape?(img.image)
		end
		@contact_image = landscape_images.sample
	end
end
