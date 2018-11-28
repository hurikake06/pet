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

Cg::Pet.create!(
  id: 1,
  user_id: 1,
  name: '桃 いぬ',
  petname: 'momoinu',
  pets_sex_info: 26,
  type_id: 1,
  about: '桃1号',
  share_pet_info: 16,
  detail_attributes: {}
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
