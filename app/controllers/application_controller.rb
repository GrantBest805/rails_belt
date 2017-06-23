class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception

  def current_user
  	
  	Borrower.find(session[:borrower_id]) if session[:borrower_id]
  
  	Lender.find(session[:lender_id]) if session[:lender_id]
  	
  end
  	helper_method :current_user
end
