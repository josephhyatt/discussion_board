class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_discussion, only: [:create, :edit, :show, :update, :destroy]

  def create
    # find reply on discussion through discussion i.d. in set_discussion 
    # using the replies create method passing in params of reply and permitting it
    # as well as the discussion i.d. (allows us to create a reply within the discussion) 
    @reply = @discussion.replies.create(params[:reply]).permit(:reply, :discussion_id)
    # i added a user_id column to the replies table
    # so this sets user_id of the reply created equal to the currnt_user_id and 
    # make that equal to the current user 
    @reply.user_id = current_user.id

    respond_to do |format|
      # if the reply is saved render a format
      if @reply.save
        # redirect to discussion_path and pass in @discussion which
        # grabs the discussion_id, using the set_discussion method below private
        format.html { redirect_to discussion_path(@discussion) }
        format.js #render create.js.erb
      else
        format.html {redirect_to discussion_path(@discussion), notice: 'Reply did not save. Try again..' }
        format.js #render create.js.erb
      end
    end
  end

  def new
  end

  def destroy
    # makes the replay = to the discussions id 
    @reply = @discussion.replies.find(params[:id])
    # destroy reply
    @reply.destroy 
    # redirect to discussion_path passing in @discussion
    redirect_to disscussion_path(@discussion)
  end

  def edit
    # find the discussion youre wanting to edit  
    @discussion = Discussion.find(params[:id])
    # using the discussion you found above find the replies on it
    # and find the one with the associated i.d. that were editing
    # (paramd[:id]) finds the ID and URL
    @reply = @discussion.replies.find(params[:id])
  end

  def update
    @reply = @discussion.replies.find(params[:id])

    respond_to do |format|
      # if the reply updates we pass in the reply_params method below under private
      if @reply.update(reply_params)
        # redirect to discussion_path and pass in @discussion which
        # grabs the discussion_id, using the set_discussion method below private
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply was sucessfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def set_discussion 
    # find discussion on the reply by discussion_id 
    @discussion = Discussion.find(params[:discussion_id])
  end 

  def set_reply 
    @reply = Reply.find(params[:id])
  end 

  def reply_params 
    params.require(:reply).permit(:reply)
  end


  
end