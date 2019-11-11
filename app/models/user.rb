class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  has_many :tasks, dependent: :destroy
  before_validation { email.downcase! } 
  
  def self.count_admins
    @users = User.all
    @admins=0
    @users.each do |user|
      if user.admin?
        @admins += 1
      end
    end
    return @admins
  end
end
