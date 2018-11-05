class Channel < ApplicationRecord
  has_many :discussions
  # allows a user to find a discussion or
  # from a discussion and find a user
  has_many :users, through: :discussions
  # applies roles using rolify gem
  # adds ability to add admin privileges to model
  resourcify
end
