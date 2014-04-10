class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true
  has_many :photos, dependent: :destroy
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
