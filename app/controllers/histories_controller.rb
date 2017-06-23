class HistoriesController < ApplicationController

	def create
		@borrower = Borrower.find(params[:id])
		@lender = Lender.find(current_user.id)
		@lent = Historie.create(hist_params)
		@borrower.raised += @lent.amount
		@borrower.money -= @lent.amount
		@borrower.save
		@lender.money -= @lent.amount
		puts @lender.money, "********"
		@lender.save
		redirect_to :back 
	end

	private
	 def hist_params
	 	params.require(:historie).permit(:amount, :borrower_id).merge(lender: current_user)
	 end
end
