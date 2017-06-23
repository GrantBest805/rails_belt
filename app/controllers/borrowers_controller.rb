class BorrowersController < ApplicationController

	def show
		@borrower = Borrower.find(params[:id])
		@histories = Historie.includes(:borrower).where(borrower: @borrower.id)
	end

	def create
		@borrower = Borrower.new(borrow_params)
		@borrower.raised = 0
		if @borrower.save
			session[:borrower_id] = @borrower.id
			redirect_to "/borrowers/#{@borrower.id}"
		else
			flash[:errors] = @borrower.errors.full_messages
			redirect_to :back
		end
	end

	private
		def borrow_params
			params.require(:borrower).permit(:first_name, :last_name, :email, :password, :purpose, :description, :money)
		end

end
