# kinda a buffer, everything flows through discussions
class Discussion < ApplicationRecord
  # discussion belongs_to a channel and a user in db/schema.rb
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy
  # validates hooks into the title and content parameter of a discussion
  # wont allow user to submit unless there is content within them
  validates :title, :content, presence: true
  # applies roles using rolify gem
  # adds ability to add admin privileges to model
  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def generate_new_friendly_id?
    title_changed?
  end

end
