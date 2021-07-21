class Position < ApplicationRecord
  has_one :position_history
  has_many :employment_terms

  accepts_nested_attributes_for :position_history
end
