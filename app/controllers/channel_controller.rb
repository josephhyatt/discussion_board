class ChannelController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  
  def index
    @channels = Channel.all  
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
  end

  def edit 
  end

  def create 
    @channel = Channel.new(channel_params)
    respond_to do |channel|
      if @channel.save 
        redirect_to channels_path, notice: 'Channel was successfully created'
      else

      end
    end
  end


end
