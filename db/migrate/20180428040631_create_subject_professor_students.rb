class CreateSubjectProfessorStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_professor_students do |t|
      t.references :subject_professor, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
