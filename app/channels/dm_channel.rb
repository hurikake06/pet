class DmChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "dm_#{params['dm_group']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
