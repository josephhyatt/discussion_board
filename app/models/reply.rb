class Reply < ApplicationRecord
  # added discussion id and user idea in db/schema file
  # a reply belongs to a discussion and a user
  belongs_to :discussion
  belongs_to :user
  # user must provide content or user cant submit a reply
  validates :reply, presence: true

  extend FriendlyId
  friendly_id :reply, use: [:slugged, :finders]

  def generate_new_friendly_id?
    reply_changed?
  end

end
