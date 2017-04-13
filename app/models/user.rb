class User < ActiveRecord::Base
  # has_and_belongs_to_many :groups
  has_many :users_groups, foreign_key: "user_id"
  has_many :groups, through: :users_groups

  has_many :project_users, dependent: :destroy, foreign_key: "user_id"
  has_many :projects, through: :project_users

end
