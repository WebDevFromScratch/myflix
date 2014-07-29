class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email, presence: true #maybe add a custom, so that it is a correct format?
  validates :password, presence: true
  validates :full_name, presence: true
end