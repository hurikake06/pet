# frozen_string_literal: true

module Cg::SharesHelper
  def shares_array shares
    {
      active:[
        shares.where(share_info: 101),
        shares.where(share_info: 102),
        shares.where(share_info: 103),
        shares.where(share_info: 104),
        shares.where(share_info: 105),
        shares.where(share_info: 106),],
      finished:[
        shares.where(share_info: 151),
        shares.where(share_info: 152),
        shares.where(share_info: 153),
        shares.where(share_info: 154),
        shares.where(share_info: 155),]
    }
  end
end
