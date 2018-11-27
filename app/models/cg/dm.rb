# frozen_string_literal: true

class Cg::Dm < ApplicationRecord
  belongs_to :cg_dm_group, foreign_key: :dm_groups_id, primary_key: :id, class_name: 'Cg::DmGroup'
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
end
