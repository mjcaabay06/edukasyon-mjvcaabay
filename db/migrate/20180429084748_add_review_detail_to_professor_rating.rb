class AddReviewDetailToProfessorRating < ActiveRecord::Migration[5.1]
  def change
    add_column :professor_ratings, :review_detail, :text
  end
end
