class User < ActiveRecord::Base
  # has_and_belongs_to_many :groups
  has_many :users_groups, foreign_key: "user_id"
  has_many :groups, through: :users_groups

  has_many :project_users, dependent: :destroy, foreign_key: "user_id"
  has_many :projects, through: :project_users

  validates_length_of :name, in: 5..255, message: "请输入长度为5~255的用户名！"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "请输入合法的email地址！"}
  validates :name, uniqueness: true

  ACTIVE_STATUS = {"激活" => true, "禁用" => false}

end
