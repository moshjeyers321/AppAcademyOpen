class User < ApplicationRecord

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
end
