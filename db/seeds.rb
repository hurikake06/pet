# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = Cg::User.new
@user.name = '桃 太郎'
@user.username = 'momo'
@user.email = 'momo@trident.com'
@user.password = 'momoPass'
@user.about = 'どんぶらこどんぶらこってすごい擬音語'
@user.save

@user = Cg::User.new
@user.name = '浦島 太郎'
@user.username = 'urashima'
@user.email = 'urashima@trident.com'
@user.password = 'urashimaPass'
@user.about = '私が亀を助けました。'
@user.save

@type = Cg::Type.new
@type.name = '犬'
@type.save
@type = Cg::Type.new
@type.name = '猫'
@type.save
@type = Cg::Type.new
@type.name = '鳥'
@type.save
@type = Cg::Type.new
@type.name = '亀'
@type.save
@type = Cg::Type.new
@type.name = '猿'
@type.save

@pet = Cg::Pet.new
@pet.users_id = 1
@pet.name = '桃 いぬ'
@pet.petname = 'momoinu'
@pet.types_id = 1
@pet.about = '桃1号'
@pet.save

@pet = Cg::Pet.new
@pet.users_id = 1
@pet.name = '桃 さる'
@pet.petname = 'momosaru'
@pet.types_id = 5
@pet.about = '桃2号'
@pet.save

@pet = Cg::Pet.new
@pet.users_id = 1
@pet.name = '桃 きじ'
@pet.petname = 'momokiji'
@pet.types_id = 3
@pet.about = '桃3号'
@pet.save

@pet = Cg::Pet.new
@pet.users_id = 2
@pet.name = '浦島 かめ'
@pet.petname = 'urashimakame'
@pet.types_id = 4
@pet.about = 'れっつ竜宮城'
@pet.save

@share_state = Cg::ShareState.new
@share_state.name = '申請'
@share_state.save
@share_state = Cg::ShareState.new
@share_state.name = '拒否'
@share_state.save
@share_state = Cg::ShareState.new
@share_state.name = '許可'
@share_state.save
@share_state = Cg::ShareState.new
@share_state.name = 'キャンセル'
@share_state.save
@share_state = Cg::ShareState.new
@share_state.name = '支払い待ち'
@share_state.save
@share_state = Cg::ShareState.new
@share_state.name = '終了'
@share_state.save
