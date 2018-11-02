class Cg::Info < ApplicationRecord
  belongs_to :cg_info_type, foreign_key: :info_types_id, primary_key: :id, class_name: 'Cg::InfoType'
end
