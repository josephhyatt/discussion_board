class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # if a user is destroyed so is their discussions
  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussuions

end
