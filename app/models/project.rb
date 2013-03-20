class Project < ActiveRecord::Base

  belongs_to :user

  scope :for_special_users, where(user_id: 5)

end
