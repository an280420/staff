class Position < ApplicationRecord
  has_one :position_history
  has_many :employment_terms
end
