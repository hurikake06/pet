# frozen_string_literal: true

class DmChannel < ApplicationCable::Channel
  def subscribed
    dm_group = Cg::DmGroup.find(params['dm_group'])
    if current_user.accesable?(dm_group)
      if dm_group.type == 'Cg::ShareDmGroup'
        stream_from "dm_#{params['dm_group']}_#{current_user.privilege(dm_group)}_channel"
      else
        stream_from "dm_#{params['dm_group']}_channel"
      end
    else
      reject
    end
  end

  def unsubscribed; end
end
