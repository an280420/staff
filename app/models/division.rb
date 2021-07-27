class Division < ApplicationRecord
  validates :name, presence: true
  
  has_many :employment_terms
  has_many :divisions, class_name: "Division", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Division", optional: true
  acts_as_tree order: "name"
  
  def tree_as_json
    users = current_users
    divisions = {name: name, users: users, children: children.map { |child| child.tree_as_json }}
  
    divisions.as_json
  end
  
  def current_users
    current_employment_terms = employment_terms.where(end_date: nil)
    users = []
    current_employment_terms.each do |employment_term|
      user = "#{employment_term.user.l_name} #{employment_term.user.f_name} #{employment_term.user.s_name} - #{employment_term.position.position_history.name}"
      users << user
    end
  
    users.sort
  end

  # def tree_as_json
  #   divisions = {name: name, children: children.map { |child| child.tree_as_json }}

  #   divisions.as_json
  # end

  # def self.tree_as_json
  #   divisions ||= {}
  #   all_divisions = self.all

  #   all_divisions.each do |division|
  #     divisions[division.id] = {name: division.name, children: division.children.tree_as_json }
  #   end

  #   divisions.as_json
  # end
end
