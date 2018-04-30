class CreateSubjectProfessors < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_professors do |t|
      t.references :subject, foreign_key: true
      t.references :professor, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
