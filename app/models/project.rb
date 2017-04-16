class Project < ActiveRecord::Base
  has_many :project_users, dependent: :destroy, foreign_key: "project_id"
  has_many :users, through: :project_users

  PROJECT_TYPES = {"外包项目" => "1", "内部项目" => "2"}

  validates_length_of :abbr_name, in: 3..255, wrong_length: "长度为%count，请输入长度为3~255的项目简称"
  validates_length_of :name, in: 5..255, wrong_length: "长度为%count，请输入长度为5~255的项目简称"
  validate :proj_end_time_cannot_be_less_than_proj_start_time
  validates :abbr_name, uniqueness: true


  def proj_end_time_cannot_be_less_than_proj_start_time
  	if proj_end_time < proj_start_time
  	  errors.add(:proj_end_time, "项目结束必须晚于项目开始时间！")
  	end
  end

end
