class Group < ActiveRecord::Base
  # has_and_belongs_to_many :users
  has_many :users_groups, foreign_key: :group_id
  has_many :users, through: :users_groups
end
