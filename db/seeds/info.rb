# frozen_string_literal: true

# 103までは契約は交わされていないのでキャンセルではなく拒否・申請取り消しを使用
Cg::Info.create!(id: 101, info_type_id: 1, value: '申請')
Cg::Info.create!(id: 102, info_type_id: 1, value: 'シェア条件の相談')
Cg::Info.create!(id: 103, info_type_id: 1, value: '再申請')

# 104の際にキャンセル機能が使える
Cg::Info.create!(id: 104, info_type_id: 1, value: 'シェア条件成立')

# 105からはキャンセル不可
Cg::Info.create!(id: 105, info_type_id: 1, value: 'シェア中')
Cg::Info.create!(id: 106, info_type_id: 1, value: '料金支払い待ち')

Cg::Info.create!(id: 151, info_type_id: 1, value: '終了')
Cg::Info.create!(id: 152, info_type_id: 1, value: '拒否')
Cg::Info.create!(id: 153, info_type_id: 1, value: '申請取り消し')
Cg::Info.create!(id: 154, info_type_id: 1, value: 'ユーザーキャンセル')
Cg::Info.create!(id: 155, info_type_id: 1, value: 'ホストキャンセル')

Cg::Info.create!(id: 201, info_type_id: 2, value: '男性')
Cg::Info.create!(id: 202, info_type_id: 2, value: '女性')

Cg::Info.create!(id: 301, info_type_id: 3, value: '日本')
Cg::Info.create!(id: 302, info_type_id: 3, value: 'マルタ')
Cg::Info.create!(id: 303, info_type_id: 3, value: 'アメリカ')

Cg::Info.create!(id: 401, info_type_id: 4, value: '利用不可')
Cg::Info.create!(id: 402, info_type_id: 4, value: '利用可能')
Cg::Info.create!(id: 501, info_type_id: 5, value: '利用不可')
Cg::Info.create!(id: 502, info_type_id: 5, value: '利用可能')
Cg::Info.create!(id: 601, info_type_id: 6, value: '利用不可')
Cg::Info.create!(id: 602, info_type_id: 6, value: '利用可能')

Cg::Info.create!(id: 701, info_type_id: 7, value: '利用不可')
Cg::Info.create!(id: 702, info_type_id: 7, value: '利用可能')

Cg::Info.create!(id: 1101, info_type_id: 11, value: 'オス')
Cg::Info.create!(id: 1102, info_type_id: 11, value: 'メス')

Cg::Info.create!(id: 1201, info_type_id: 12, value: '日')
Cg::Info.create!(id: 1202, info_type_id: 12, value: '月')
Cg::Info.create!(id: 1203, info_type_id: 12, value: '火')
Cg::Info.create!(id: 1204, info_type_id: 12, value: '水')
Cg::Info.create!(id: 1205, info_type_id: 12, value: '木')
Cg::Info.create!(id: 1206, info_type_id: 12, value: '金')
Cg::Info.create!(id: 1207, info_type_id: 12, value: '土')

Cg::Info.create!(id: 1301, info_type_id: 13, value: 'ホストを評価')
Cg::Info.create!(id: 1302, info_type_id: 13, value: 'ユーザーを評価')

Cg::Info.create!(id: 1401, info_type_id: 14, value: '一般DM')
Cg::Info.create!(id: 1402, info_type_id: 14, value: 'シェア用DM')

Cg::Info.create!(id: 1501, info_type_id: 15, value: '未入力')
Cg::Info.create!(id: 1502, info_type_id: 15, value: '入力済み')
Cg::Info.create!(id: 1503, info_type_id: 15, value: '反映済み')

Cg::Info.create!(id: 10001, info_type_id: 100, value: '未登録')
Cg::Info.create!(id: 10002, info_type_id: 100, value: '登録済み')
