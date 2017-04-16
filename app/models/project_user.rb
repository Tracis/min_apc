class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  PROJECT_ROLES = {"美术经理" => "1", "美术制作" => "2", "美术接口人" => "3"}

  validates :project_id, :user_id, presence: true

  def project_role_type
  	PROJECT_ROLES.index(self.project_role)
  end

  def project_role_type=(role_type)
  	self.project_role = PROJECT_ROLES[role_type]
  end

end
