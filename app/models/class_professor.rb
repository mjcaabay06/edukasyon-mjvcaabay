class ClassProfessor < ApplicationRecord
  belongs_to :class
  belongs_to :professor
  belongs_to :status
end
