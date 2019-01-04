# frozen_string_literal: true

class DmChannel < ApplicationCable::Channel
  def subscribed
    dm_group = Cg::DmGroup.find(params['dm_group'])
    if current_user.accesable?(dm_group)
      stream_from "dm_#{params['dm_group']}_channel"
    else
      reject
    end
  end

  def unsubscribed; end
end
