# kinda a buffer, everything flows through discussions
class Discussion < ApplicationRecord
  # discussion belongs_to a channel and a user in db/schema.rb
  belongs_to :channel 
  belongs_to :user 
  has_many :replys, dependent: :destroy 
  # validates hooks into the title and content parameter of a discussion
  # wont allow user to submit unless there is content within them
  validates :title, :content, presence: true
  
end
