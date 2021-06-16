class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, { presence: true, uniqueness: true }
  validates :password, presence: true

  has_secure_password
  has_many :todos
end
