class User < ApplicationRecord
  validates :l_name, :f_name, :s_name, presence: true

  has_many :employment_terms, dependent: :destroy
end
