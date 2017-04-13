class Project < ActiveRecord::Base
  has_many :project_users, dependent: :destroy, foreign_key: "project_id"
  has_many :users, through: :project_users
end
