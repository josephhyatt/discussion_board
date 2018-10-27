class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :find_channels, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @channels = Channel.all
    @discussions = Discussion.all.order('created_at desc')
  end

  def show
    @discussions = Discussion.all.order('created_at desc')
  end

  def new
    # look for current user and access discussions and build (look up build)  
    @discussions = curent_user.discussions.build
  end 

  def edit
  end

  def create 
    @discussions = curent_user.discussions.build(discussion_params)
  end 

  def update  
  end

  def destroy  
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def find_channels
    @channels = Channel.all.order('created_at desc')
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def discussion_params
    params.require(:discussion).permit(:title, :content, :channel_id)
  end

end
