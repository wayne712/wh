class User < ApplicationRecord
  has_secure_password
  has_many :acquires

  enum department: {'妇产科' => 1, '神经科' => 2, '泌尿科' => 3}
end
