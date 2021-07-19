class Division < ApplicationRecord
  validates :name, presence: true

  has_many :employment_terms
  has_many :divisions, class_name: "Division", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Division", optional: true
end