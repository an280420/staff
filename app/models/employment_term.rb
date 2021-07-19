class EmploymentTerm < ApplicationRecord
  validates :begin_date, presence: true
  
  belongs_to :user
  belongs_to :division
  belongs_to :position
end
