class AddRevieweeToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :reviewee, :string
  end
end
