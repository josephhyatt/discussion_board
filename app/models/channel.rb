class Channel < ApplicationRecord
  has_many :discussions
  # allows a user to find a discussion or
  # from a discussion and find a user
  has_many :users, through: :discussions
  # applies roles using rolify gem
  # adds ability to add admin privileges to model
  resourcify

  extend FriendlyId
  friendly_id :channel, use: [:slugged, :finders]

  def generate_new_friendly_id?
    channel_changed?
  end

end
