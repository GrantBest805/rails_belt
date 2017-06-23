class LendersController < ApplicationController

	def show
		@lender = Lender.find(current_user.id)
		@borrowers = Borrower.all
		@histories = Historie.where(lender: @lender.id)
	end

	def create
		@lender = Lender.new(lender_params)
		if @lender.save
			session[:lender_id] = @lender.id
			redirect_to "/lenders/#{@lender.id}"
		else
			flash[:errors] = @lender.errors.full_messages
			redirect_to :back
		end
	end
	private
		def lender_params
			params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
		end

end
