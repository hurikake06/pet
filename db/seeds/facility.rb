# frozen_string_literal: true

(1..5).each do |i|
  Cg::Facility.create!(id: i + 1, name: "施設#{i}", address: "住所#{i}")
end
