# frozen_string_literal: true

(1..5).each do |i|
  Cg::Facility.create!(id: i, name: "施設#{i}", address: "住所#{i}")
end

Cg::Facility.create!(id: 6, name: "竜宮城", address: "竜宮城41-3")
Cg::Facility.create!(id: 7, name: "ドッグラン山田", address: "東京都八王子市")
Cg::Facility.create!(id: 8, name: "広い公園", address: "北海道札幌市41-3")
Cg::Facility.create!(id: 9, name: "山田中学校体育館", address: "東京都八王子市")
Cg::Facility.create!(id: 10, name: "納豆工場跡地", address: "愛知県中区41-3")
Cg::Facility.create!(id: 11, name: "トライデント校舎", address: "愛知県中区")
