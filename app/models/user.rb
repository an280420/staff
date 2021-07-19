class User < ApplicationRecord
  validates :l_name, :f_name, :s_name, presence: true
end
