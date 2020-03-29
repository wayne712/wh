class AdminUser < ApplicationRecord
  has_secure_password

  has_many :action_logs, class_name: :AdminLog
  has_many :items
end
