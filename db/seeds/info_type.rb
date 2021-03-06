# frozen_string_literal: true

Cg::InfoType.create!(id: 1, value: 'share')
Cg::InfoType.create!(id: 2, value: 'sex')
Cg::InfoType.create!(id: 3, value: 'country')
Cg::InfoType.create!(id: 4, value: 'share_user')
Cg::InfoType.create!(id: 5, value: 'share_host')
Cg::InfoType.create!(id: 6, value: 'share_pet')
Cg::InfoType.create!(id: 7, value: 'share_type')

# 特に使ってない
Cg::InfoType.create!(id: 8, value: 'document')
Cg::InfoType.create!(id: 9, value: 'credit')
Cg::InfoType.create!(id: 10, value: 'medical')

Cg::InfoType.create!(id: 11, value: 'pets_sex')
Cg::InfoType.create!(id: 12, value: 'weekday')
Cg::InfoType.create!(id: 13, value: 'ev_type')
Cg::InfoType.create!(id: 14, value: 'dm_group_type')
Cg::InfoType.create!(id: 15, value: 'ev')

# 汎用性のあるもの
Cg::InfoType.create!(id: 100, value: 'system')
