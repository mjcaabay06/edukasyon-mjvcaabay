class AddRateToProfessorRating < ActiveRecord::Migration[5.1]
  def change
    add_column :professor_ratings, :rate, :integer
  end
end
