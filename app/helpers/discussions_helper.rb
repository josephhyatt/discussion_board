module DiscussionsHelper
  # method check if current user i.d. is the same as the author of the discussion
  # used in the discussion views (views/shared/_discussions.html.erb)
  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end
  # method checking if current user i.d. is the same as the author of the reply
  # used in the discussion views (views/shared/_discussions.html.erb)
  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end
