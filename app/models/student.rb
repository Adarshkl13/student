class Student < ApplicationRecord
    validates :student_name, presence: true
    validates :subject_name, presence: true
    validates :mark, presence: true
    validates_uniqueness_of :student_name, scope: :subject_name, message: 'and subject combination already exists.'
end
  
