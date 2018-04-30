class AddStatusToSubject < ActiveRecord::Migration[5.1]
  def change
    add_reference :subjects, :status, foreign_key: true
  end
end
