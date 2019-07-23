class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  
  def index
    @channels = Channel.all
    @discussions = Discussion.all.order('created_at desc')
  end

  def show
    # find discussion where the channel_id matches channels actual i.d.
    # for the discussion table I created a channel i.d. and need those two to match
    # if the i.d.s match up then that means they correspond and relate to each other
    @discussions = Discussion.where('channel_id = ?', @channel.id) 
    # querry through all channels
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def edit 
  end

  def create 
    @channel = Channel.new(channel_params)
    if @channel.save 
      redirect_to channels_path, notice: 'Channel was successfully created'
    else
      render 'new'
    end
  end

  def update
    if @channel.update(channel_params)
      redirect_to channels_path, notice: 'Channel was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @channel.destroy
    redirect_to channels_url, notice: 'Channel was successfully destroyed.' 
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_channel
    @channel = Channel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def channel_params
    params.require(:channel).permit(:channel)
  end

end
