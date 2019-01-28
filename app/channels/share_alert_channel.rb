# frozen_string_literal: true

class ShareAlertChannel < ApplicationCable::Channel
  def subscribed
    share = Cg::Share.find(params['share_id'])
    stream_from "share_alert_#{share.id}_#{current_user.privilege(share)}_channel"
  end

  def unsubscribed; end
end
