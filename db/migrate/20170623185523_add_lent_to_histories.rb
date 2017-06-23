class AddLentToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :lent, :integer
  end
end
