# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cg::User.transaction do
  @user = Cg::User.new
  @user.name = '桃 太郎'
  @user.username = 'momo'
  @user.email = 'momo@trident.com'
  @user.password = 'momoPass'
  @user.about = 'どんぶらこどんぶらこってすごい擬音語'
  @user.share_user_info = 12
  @user.share_host_info = 14
  @user.save!

  @user_detail = Cg::UserDetail.new
  @user_detail.users_id = 1
  @user_detail.save!

  @user = Cg::User.new
  @user.name = '浦島 太郎'
  @user.username = 'urashima'
  @user.email = 'urashima@trident.com'
  @user.password = 'urashimaPass'
  @user.about = '私が亀を助けました。'
  @user.share_user_info = 12
  @user.share_host_info = 14
  @user.save!

  @user_detail = Cg::UserDetail.new
  @user_detail.users_id = 2
  @user_detail.save!

  @type = Cg::Type.new
  @type.name = '犬'
  @type.save!
  @type = Cg::Type.new
  @type.name = '猫'
  @type.save!
  @type = Cg::Type.new
  @type.name = '鳥'
  @type.save!
  @type = Cg::Type.new
  @type.name = '亀'
  @type.save!
  @type = Cg::Type.new
  @type.name = '猿'
  @type.save!

  @pet = Cg::Pet.new
  @pet.users_id = 1
  @pet.name = '桃 いぬ'
  @pet.petname = 'momoinu'
  @pet.types_id = 1
  @pet.about = '桃1号'
  @pet.share_pet_info = 16
  @pet.save!

  @pet = Cg::Pet.new
  @pet.users_id = 1
  @pet.name = '桃 さる'
  @pet.petname = 'momosaru'
  @pet.types_id = 5
  @pet.about = '桃2号'
  @pet.share_pet_info = 16
  @pet.save!

  @pet = Cg::Pet.new
  @pet.users_id = 1
  @pet.name = '桃 きじ'
  @pet.petname = 'momokiji'
  @pet.types_id = 3
  @pet.about = '桃3号'
  @pet.share_pet_info = 16
  @pet.save!

  @pet = Cg::Pet.new
  @pet.users_id = 2
  @pet.name = '浦島 かめ'
  @pet.petname = 'urashimakame'
  @pet.types_id = 4
  @pet.about = 'れっつ竜宮城'
  @pet.share_pet_info = 16
  @pet.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'share'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'sex'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'country'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'share_user'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'share_host'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'share_pet'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'document'
  @info_type.save!

  @info_type = Cg::InfoType.new
  @info_type.value = 'credit'
  @info_type.save!

  @info = Cg::Info.new
  @info.info_types_id = 1
  @info.value = '申請'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 1
  @info.value = '許可'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 1
  @info.value = '拒否'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 1
  @info.value = 'キャンセル'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 1
  @info.value = '支払い待ち'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 1
  @info.value = '終了'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 2
  @info.value = '男性'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 2
  @info.value = '女性'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 3
  @info.value = '日本'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 3
  @info.value = 'マルタ'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 3
  @info.value = 'アメリカ'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 4
  @info.value = '利用不可'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 4
  @info.value = '利用可能'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 5
  @info.value = '利用不可'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 5
  @info.value = '利用可能'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 6
  @info.value = '利用不可'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 6
  @info.value = '利用可能'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 7
  @info.value = '未登録'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 7
  @info.value = '登録済み'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 8
  @info.value = '未登録'
  @info.save!

  @info = Cg::Info.new
  @info.info_types_id = 8
  @info.value = '登録済み'
  @info.save!
end
