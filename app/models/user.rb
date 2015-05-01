class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true, email: true
  validates :first_name, presence: true

  has_many :recipes

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
