# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/facility.rb'

Cg::InfoType.create!(id: 1, value: 'share')
Cg::InfoType.create!(id: 2, value: 'sex')
Cg::InfoType.create!(id: 3, value: 'country')
Cg::InfoType.create!(id: 4, value: 'share_user')
Cg::InfoType.create!(id: 5, value: 'share_host')
Cg::InfoType.create!(id: 6, value: 'share_pet')
Cg::InfoType.create!(id: 7, value: 'document')
Cg::InfoType.create!(id: 8, value: 'credit')
Cg::InfoType.create!(id: 9, value: 'share_type')
Cg::InfoType.create!(id: 10, value: 'medical')
Cg::InfoType.create!(id: 11, value: 'pets_sex')
Cg::InfoType.create!(id: 12, value: 'weekday')
Cg::InfoType.create!(id: 100, value: 'system')

Cg::Info.create!(id: 1, info_types_id: 1, value: '申請')
Cg::Info.create!(id: 2, info_types_id: 1, value: '許可')
Cg::Info.create!(id: 3, info_types_id: 1, value: '拒否')
Cg::Info.create!(id: 4, info_types_id: 1, value: 'キャンセル')
Cg::Info.create!(id: 5, info_types_id: 1, value: '支払い待ち')
Cg::Info.create!(id: 6, info_types_id: 1, value: '終了')

Cg::Info.create!(id: 7, info_types_id: 2, value: '男性')
Cg::Info.create!(id: 8, info_types_id: 2, value: '女性')

Cg::Info.create!(id: 9, info_types_id: 3, value: '日本')
Cg::Info.create!(id: 10, info_types_id: 3, value: 'マルタ')
Cg::Info.create!(id: 11, info_types_id: 3, value: 'アメリカ')

Cg::Info.create!(id: 12, info_types_id: 4, value: '利用不可')
Cg::Info.create!(id: 13, info_types_id: 4, value: '利用可能')
Cg::Info.create!(id: 14, info_types_id: 5, value: '利用不可')
Cg::Info.create!(id: 15, info_types_id: 5, value: '利用可能')
Cg::Info.create!(id: 16, info_types_id: 6, value: '利用不可')
Cg::Info.create!(id: 17, info_types_id: 6, value: '利用可能')

Cg::Info.create!(id: 22, info_types_id: 9, value: '利用不可')
Cg::Info.create!(id: 23, info_types_id: 9, value: '利用可能')

Cg::Info.create!(id: 26, info_types_id: 11, value: 'オス')
Cg::Info.create!(id: 27, info_types_id: 11, value: 'メス')

Cg::Info.create!(id: 28, info_types_id: 12, value: '日')
Cg::Info.create!(id: 29, info_types_id: 12, value: '月')
Cg::Info.create!(id: 30, info_types_id: 12, value: '火')
Cg::Info.create!(id: 31, info_types_id: 12, value: '水')
Cg::Info.create!(id: 32, info_types_id: 12, value: '木')
Cg::Info.create!(id: 33, info_types_id: 12, value: '金')
Cg::Info.create!(id: 34, info_types_id: 12, value: '土')

Cg::Info.create!(id: 100, info_types_id: 100, value: '未登録')
Cg::Info.create!(id: 101, info_types_id: 100, value: '登録済み')

Cg::User.create!(
  id: 1,
  name: '桃 太郎',
  username: 'momo',
  email: 'momo@trident.com',
  password: 'Pass_momo0',
  about: 'どんぶらこどんぶらこってすごい擬音語',
  share_user_info: 12,
  share_host_info: 14,
  cg_user_detail_attributes: {
    first_name: '',
    last_name: '',
    address: '',
    document_info: 100,
    credit_info: 100,
    age: 25,
    sex_info: 7,
    country_info: 9
  }
)

Cg::User.create!(
  id: 2,
  name: '浦島 太郎',
  username: 'urashima',
  email: 'urashima@trident.com',
  password: 'Pass_urashima0',
  about: '私が亀を助けました。',
  share_user_info: 12,
  share_host_info: 14,
  cg_user_detail_attributes: {
    document_info: 100,
    credit_info: 100,
    age: 23,
    sex_info: 7,
    country_info: 9
  }
)

Cg::User.create!(
  id: 3,
  name: 'てすと',
  username: 'test_username',
  email: 'test@trident.com',
  password: 'Test_0',
  about: 'テストユーザです',
  share_user_info: 12,
  share_host_info: 14,
  cg_user_detail_attributes: {
  }
)

Cg::Type.create!(id: 1, name: '犬', share_type_info: 23)

Cg::Type.create!(id: 2, name: '猫', share_type_info: 23)

Cg::Type.create!(id: 3, name: '鳥', share_type_info: 22)

Cg::Type.create!(id: 4, name: '亀', share_type_info: 22)

Cg::Type.create!(id: 5, name: '猿', share_type_info: 22)

Cg::Type.create!(id: 6, name: '魚', share_type_info: 22)

Cg::Pet.create!(
  id: 1,
  users_id: 1,
  name: '桃 いぬ',
  petname: 'momoinu',
  pets_sex_info: 26,
  types_id: 1,
  about: '桃1号',
  share_pet_info: 16,
  cg_pet_detail_attributes: {}
)

Cg::Pet.create!(
  id: 2,
  users_id: 1,
  name: '桃 猿',
  petname: 'momosaru',
  pets_sex_info: 26,
  types_id: 5,
  about: '桃2号',
  share_pet_info: 16,
  cg_pet_detail_attributes: {}
)

Cg::Pet.create!(
  id: 3,
  users_id: 1,
  name: '桃 キジ',
  pets_sex_info: 27,
  petname: 'momokiji',
  types_id: 3,
  about: '桃3号',
  share_pet_info: 16,
  cg_pet_detail_attributes: {}
)

Cg::Pet.create!(
  id: 4,
  users_id: 2,
  name: '浦島 かめ',
  petname: 'urashimakame',
  pets_sex_info: 26,
  types_id: 4,
  about: 'れっつ竜宮城',
  share_pet_info: 16,
  cg_pet_detail_attributes: {}
)
