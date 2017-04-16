class Group < ActiveRecord::Base
  # has_and_belongs_to_many :users
  has_many :users_groups, foreign_key: :group_id
  has_many :users, through: :users_groups

  validates_length_of :name, in: 5..255, wrong_length: "长度为%count，请输入长度为5~255的组名称！"
  validates :name, uniqueness: true

end