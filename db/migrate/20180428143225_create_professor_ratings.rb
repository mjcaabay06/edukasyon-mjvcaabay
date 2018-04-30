class CreateProfessorRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :professor_ratings do |t|
      t.references :professor, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
