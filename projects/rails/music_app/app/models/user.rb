class User < ApplicationRecord
  
  attr_reader :password
  
  validates :email, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: 'Password can\'t be blank!'}
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
