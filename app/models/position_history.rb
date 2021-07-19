class PositionHistory < ApplicationRecord
  validates :name, :begin_date, presence: true
  belongs_to :position
end
