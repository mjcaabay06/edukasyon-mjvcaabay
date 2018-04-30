class AddSidToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :sid, :string
  end
end
