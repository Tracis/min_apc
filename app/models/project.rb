class Project < ActiveRecord::Base
  validates :abbr_name, presence: true,
                        length: { in: 3..20, wrong_length: "%{count} 项目简介长度为3~20！" }
end
