class RequestsController < ApplicationController
  def create
    @request = current_user.requests.new(requester_id: request_params[:requester_id])
    
    if @request.save
      redirect_to "/users/#{@request.requester_id}"
    else
      redirect_to "/users/#{@request.requester_id}"      
    end
  end
  
  private
  
  def request_params
    params.require(:request).permit(:requester_id)
  end
end
