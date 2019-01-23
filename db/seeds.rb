
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
  id: 0,
  name: '運営アカウント',
  username: 'CuteGift',
  icon: open("#{Rails.root}/app/assets/images/icon/logo/index_top.png"),
  email: 'support_cutegift@smartapp.com',
  password: 'Pa$$w0rd',
  about: 'CuteGiftの公式アカウントです',
  share_user_info: 402,
  share_host_info: 501,
  detail_attributes: {
    first_name: '',
    last_name: '',
    address: '',
    document_info: 10002,
    credit_info: 10002,
    age: 25,
    sex_info: 201,
    country_info: 301
  }
)

Cg::User.create!(
  id: 1,
  name: 'ペットショップ桃太郎',
  username: 'momo',
  icon: open("#{Rails.root}/app/assets/images/sample/person/man_1.jpg"),
  email: 'momo@trident.com',
  password: 'Pass_momo0',
  about: '名古屋市内でのシェアができます。',
  share_user_info: 402,
  share_host_info: 502,
  detail_attributes: {
    first_name: '',
    last_name: '',
    address: '',
    document_info: 10002,
    credit_info: 10002,
    age: 25,
    sex_info: 201,
    country_info: 301
  }
)

Cg::User.create!(
  id: 2,
  name: 'ワンらぷ',
  username: 'urashima',
  icon: open("#{Rails.root}/app/assets/images/sample/person/man_2.jpg"),
  email: 'urashima@trident.com',
  password: 'Pass_urashima0',
  about: '小型犬を多く取り揃えています。',
  share_user_info: 401,
  share_host_info: 501,
  detail_attributes: {
    document_info: 10001,
    credit_info: 10001,
    age: 23,
    sex_info: 201,
    country_info: 301
  }
)

Cg::User.create!(
  id: 3,
  name: '動物愛護センター（名古屋）',
  username: 'test_username',
  icon: open("#{Rails.root}/app/assets/images/sample/person/man_3.jpg"),
  email: 'test@trident.com',
  password: 'Test_0',
  about: '保護されたワンちゃんとの出会いをしませんか？',
  share_user_info: 401,
  share_host_info: 501,
  detail_attributes: {
  }
)

Cg::User.create!(
  id: 4,
  name: 'ペットショップパトラ',
  username: 'patora',
  icon: open("#{Rails.root}/app/assets/images/sample/person/woman_1.jpg"),
  email: 'patora@trident.com',
  password: 'Pass_patora0',
  about: 'パトラです。営業中。。',
  share_user_info: 401,
  share_host_info: 502,
  detail_attributes: {
    last_name: 'ペットショップ',
    first_name: 'パトラ',
    address: '愛知県〇〇市〇〇町123-1',
    document_info: 10002,
    credit_info: 10002,
    country_info: 301
  }
)

Cg::User.create!(
  id: 5,
  name: 'トライデント 太郎',
  username: 'taro',
  icon: open("#{Rails.root}/app/assets/images/sample/person/man_4.jpg"),
  email: 'taro@trident.com',
  password: 'Pass_taro0',
  about: 'トイプードルが好きです。',
  share_user_info: 402,
  share_host_info: 502,
  detail_attributes: {
    last_name: 'トライデント',
    first_name: '太郎',
    address: '愛知県△△区△△町123-1',
    document_info: 10002,
    credit_info: 10002,
    age: 21,
    sex_info: 201,
    country_info: 301
  }
)

Cg::User.create!(
  id: 6,
  name: 'トライデント ダメ太郎',
  username: 'dame',
  icon: open("#{Rails.root}/app/assets/images/sample/person/woman_2.jpg"),
  email: 'dame@trident.com',
  password: 'Pass_taro0',
  about: '弟です',
  share_user_info: 401,
  share_host_info: 501,
  detail_attributes: {
    last_name: 'トライデント',
    first_name: 'ダメ太郎',
    address: '愛知県△△区△△町123-1',
    document_info: 10001,
    credit_info: 10001,
    age: 15,
    sex_info: 201,
    country_info: 301
  }
)

Cg::Pet.create!(
  id: 1,
  user_id: 1,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/dog_1.jpg"),
  name: '桃 いぬ',
  petname: 'momoinu',
  pets_sex_info: 1101,
  type_id: 1,
  about: '大型・秋田犬です。',
  share_pet_info: 601,
  detail_attributes: {
    fixed_cost: 1000,
    variable_cost: 500,
    share_about: ''
  }
)

Cg::Pet.create!(
  id: 2,
  user_id: 1,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/dog_2.jpg"),
  name: 'チョコ',
  petname: 'momosaru',
  pets_sex_info: 1101,
  type_id: 5,
  about: '人懐っこく、頭のいい子です。',
  share_pet_info: 601,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 3,
  user_id: 1,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/dog_3.jpg"),
  name: 'クッキー',
  pets_sex_info: 1102,
  petname: 'momokiji',
  type_id: 3,
  about: 'きれい好きな女の子です。※女性のシェア限定',
  share_pet_info: 601,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 4,
  user_id: 2,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/dog_4.jpg"),
  name: 'あんこ',
  petname: 'urashimakame',
  pets_sex_info: 1102,
  type_id: 4,
  about: 'おしゃれ大好き、ファッションリーダー！',
  share_pet_info: 601,
  detail_attributes: {}
)

Cg::Pet.create!(
  id: 5,
  user_id: 4,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/dog_5.jpg"),
  name: 'ココ',
  petname: 'coco',
  pets_sex_info: 1101,
  type_id: 1,
  about: 'ここ',
  share_pet_info: 602,
  detail_attributes: {
    medical_info: 10002,
    fixed_cost: 1000,
    variable_cost: 1500,
    share_about: '超人気なので少し値段が高いです。'
  }
)

Cg::Pet.create!(
  id: 6,
  user_id: 4,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/cat_1.jpg"),
  name: 'モモ',
  petname: 'momo',
  pets_sex_info: 1102,
  type_id: 1,
  about: 'もも',
  share_pet_info: 602,
  detail_attributes: {
    medical_info: 10002,
    fixed_cost: 1000,
    variable_cost: 800,
    share_about: 'ベテラン犬。おとなしいです。'
  }
)

Cg::Pet.create!(
  id: 7,
  user_id: 4,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/cat_2.jpg"),
  name: 'マロン',
  petname: 'marron',
  pets_sex_info: 1102,
  type_id: 1,
  about: 'まろん',
  share_pet_info: 602,
  detail_attributes: {
    medical_info: 10002,
    fixed_cost: 1000,
    variable_cost: 500,
    share_about: '新人。若いのでボール遊びなど可。'
  }
)

Cg::Pet.create!(
  id: 8,
  user_id: 5,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/cat_3.jpg"),
  name: 'コタロウ',
  petname: 'kotaro',
  pets_sex_info: 1101,
  type_id: 1,
  about: 'コタロウです',
  share_pet_info: 602,
  detail_attributes: {
    medical_info: 10002,
    fixed_cost: 1200,
    variable_cost: 1000,
    share_about: '頭のいい子です。お金持ちと子供にやさしい。'
  }
)

Cg::Pet.create!(
  id: 9,
  user_id: 5,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/cat_4.jpg"),
  name: 'タマ',
  petname: 'tama',
  pets_sex_info: 1101,
  type_id: 2,
  about: '真っ白い猫です。お魚はくわえません。',
  share_pet_info: 601,
  detail_attributes: {
    variable_cost: 1000,
    share_about: '室内限定貸し出しを予定しています。'
  }
)

Cg::Pet.create!(
  id: 10,
  user_id: 6,
  icon: open("#{Rails.root}/app/assets/images/sample/animal/cat_5.jpg"),
  name: 'ゴクウ',
  petname: 'goku',
  pets_sex_info: 1101,
  type_id: 5,
  about: 'ごくうだよ',
  share_pet_info: 601,
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

Cg::User.all.each do |user|
  user.password = 'pass'
  user.save(validate: false)
end
