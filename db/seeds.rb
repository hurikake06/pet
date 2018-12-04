# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/info_type.rb'
require './db/seeds/info.rb'
require './db/seeds/facility.rb'
require './db/seeds/type.rb'

Cg::User.create!(
  id: 1,
  name: '桃 太郎',
  username: 'momo',
  email: 'momo@trident.com',
  password: 'Pass_momo0',
  about: 'どんぶらこどんぶらこってすごい擬音語',
  share_user_info: 12,
  share_host_info: 14,
  detail_attributes: {
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
  detail_attributes: {
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
  detail_attributes: {
  }
)

Cg::User.create!(
  id: 4,
  name: 'ペットショップパトラ',
  username: 'patora',
  email: 'patora@trident.com',
  password: 'Pass_patora0',
  about: 'パトラです。営業中。。',
  share_user_info: 12,
  share_host_info: 15,
  detail_attributes: {
  }
)
Cg::User.create!(
  id: 5,
  name: 'トライデント 太郎',
  username: 'taro',
  email: 'taro@trident.com',
  password: 'Pass_taro0',
  about: '兄です',
  share_user_info: 13,
  share_host_info: 15,
  detail_attributes: {
  }
)
Cg::User.create!(
  id: 6,
  name: 'トライデント ﾀﾞﾒ太郎',
  username: 'dame',
  email: 'dame@trident.com',
  password: 'Pass_taro0',
  about: '弟です',
  share_user_info: 12,
  share_host_info: 14,
  detail_attributes: {
  }
)

Cg::Pet.create!(
  id: 1,
  user_id: 1,
  name: '桃 いぬ',
  petname: 'momoinu',
  pets_sex_info: 26,
  type_id: 1,
  about: '桃1号',
  share_pet_info: 16,
  detail_attributes: {
    fixed_cost: 1000,
    variable_cost: 500,
    share_about: ''
  }
)

Cg::Pet.create!(
  id: 2,
  user_id: 1,
  name: '桃 猿',
  petname: 'momosaru',
  pets_sex_info: 26,
  type_id: 5,
  about: '桃2号',
  share_pet_info: 16,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 3,
  user_id: 1,
  name: '桃 キジ',
  pets_sex_info: 27,
  petname: 'momokiji',
  type_id: 3,
  about: '桃3号',
  share_pet_info: 16,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 4,
  user_id: 2,
  name: '浦島 かめ',
  petname: 'urashimakame',
  pets_sex_info: 26,
  type_id: 4,
  about: 'れっつ竜宮城',
  share_pet_info: 16,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 5,
  user_id: 4,
  name: 'ココ',
  petname: 'coco',
  pets_sex_info: 26,
  type_id: 1,
  about: 'ここ',
  share_pet_info: 17,
  detail_attributes: {
    fixed_cost: 1000,
    variable_cost: 1500,
    share_about: '超人気なので少し値段が高いです。'
  }
)
Cg::Pet.create!(
  id: 6,
  user_id: 4,
  name: 'モモ',
  petname: 'momo',
  pets_sex_info: 27,
  type_id: 1,
  about: 'もも',
  share_pet_info: 17,
  detail_attributes: {
    fixed_cost: 1000,
    variable_cost: 800,
    share_about: 'ベテラン犬。おとなしいです。'
  }
)
Cg::Pet.create!(
  id: 7,
  user_id: 4,
  name: 'マロン',
  petname: 'marron',
  pets_sex_info: 27,
  type_id: 1,
  about: 'まろん',
  share_pet_info: 17,
  detail_attributes: {
    fixed_cost: 1000,
    variable_cost: 500,
    share_about: '新人。若いのでボール遊びなど可。'
  }
)

Cg::Pet.create!(
  id: 8,
  user_id: 5,
  name: 'コタロウ',
  petname: 'kotaro',
  pets_sex_info: 26,
  type_id: 1,
  about: 'コタロウです',
  share_pet_info: 17,
  detail_attributes: {
    fixed_cost: 1200,
    variable_cost: 1000,
    share_about: '頭のいい子です。お金持ちと子供にやさしい。'
  }
)

Cg::Pet.create!(
  id: 9,
  user_id: 5,
  name: 'タマ',
  petname: 'tama',
  pets_sex_info: 26,
  type_id: 2,
  about: 'タマです',
  share_pet_info: 16,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 10,
  user_id: 6,
  name: 'ゴクウ',
  petname: 'goku',
  pets_sex_info: 26,
  type_id: 5,
  about: 'ごくうだよ',
  share_pet_info: 16,
  detail_attributes: {}
)

Cg::PetsFacility.create!(
  id: 1,
  pet_id: 5,
  facility_id: 7
)

Cg::PetsFacility.create!(
  id: 2,
  pet_id: 5,
  facility_id: 8
)

Cg::PetsFacility.create!(
  id: 3,
  pet_id: 5,
  facility_id: 9
)
Cg::PetsFacility.create!(
  id: 4,
  pet_id: 6,
  facility_id: 7
)

Cg::PetsFacility.create!(
  id: 5,
  pet_id: 6,
  facility_id: 8
)

Cg::PetsFacility.create!(
  id: 6,
  pet_id: 6,
  facility_id: 9
)
Cg::PetsFacility.create!(
  id: 7,
  pet_id: 7,
  facility_id: 7
)

Cg::PetsFacility.create!(
  id: 8,
  pet_id: 7,
  facility_id: 8
)

Cg::PetsFacility.create!(
  id: 9,
  pet_id: 7,
  facility_id: 9
)

Cg::PetsFacility.create!(
  id: 10,
  pet_id: 8,
  facility_id: 10
)

Cg::PetsFacility.create!(
  id: 11,
  pet_id: 8,
  facility_id: 11
)
