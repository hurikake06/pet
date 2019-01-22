# frozen_string_literal: true

(1..5).each do |i|
  Cg::Facility.create!(id: i, name: "施設#{i}", address: "住所#{i}")
end

Cg::Facility.create!(id: 6, name: "八事ドッグラン", address: " 愛知県名古屋市天白区表山2丁目302")
Cg::Facility.create!(id: 7, name: "ドッグランカフェハッピーランド", address: " 愛知県稲沢市稲島東2-123")
Cg::Facility.create!(id: 8, name: "スタジオドッグラン", address: "名古屋市南区本地通3丁目8-1")
Cg::Facility.create!(id: 9, name: "庄内緑地 ドックラン", address: "愛知県名古屋市西区山田町大字中小田井")
Cg::Facility.create!(id: 10, name: "ワンちゃんＨＯＵＳＥまると", address: "愛知県名古屋市南区千竈通1丁目39-2")
Cg::Facility.create!(id: 11, name: "ドッグリゾート犬山", address: "愛知県犬山市今井（大字）山神洞9")
