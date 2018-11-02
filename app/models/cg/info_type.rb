class Cg::InfoType < ApplicationRecord
  has_many :cg_infos, class_name: 'Cg::Info'
end
