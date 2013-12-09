class TextMessagesController < ApplicationController  
  def new
    @text_message = TextMessage.new
  end
  
  def send_message
    @text_message = TextMessage.new(params[:text_message])

    if @text_message.save
      if @text_message.scheduled_date == nil
        TwilioWorker.perform_async(@text_message.id)
      elsif @text_message.scheduled_date != nil 
        time = ((@text_message.scheduled_date - @text_message.created_at) / 3600).round
        TwilioWorker.perform_at(time.hours, @text_message.id)
        
      else
        p "something happened"
      end
      
    else
      redirect_to action: 'new'
    end
  end
end