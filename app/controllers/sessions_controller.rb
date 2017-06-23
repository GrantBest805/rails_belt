class SessionsController < ApplicationController
	def index
	end

	def login_l 
		
	end

	def login_b
		
	end

	def create_l
		@lender = Lender.find_by(email: params[:lender][:email])
		session[:lender_id] = @lender.id
		redirect_to "/lenders/#{@lender.id}"
	end

	def create_b
		@borrower = Borrower.find_by(email: params[:borrower][:email])
		session[:borrower_id] = @borrower.id
		redirect_to "/borrowers/#{@borrower.id}"
	end

	def destroy
  	reset_session
  	redirect_to :root
  end

end
