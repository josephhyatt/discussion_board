class Channel < ApplicationRecord
  has_many :discussions 
  # allows a user to find a discussion or
  # from a discussion and find a user
  has_many :users, through: :discussions
end
