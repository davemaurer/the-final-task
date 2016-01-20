class User < ActiveRecord::Base
  has_many :tasks

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates_confirmation_of :password
end
