# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_26_052627) do

  create_table "cg_dm_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type"
    t.bigint "user_id"
    t.bigint "pet_id"
    t.bigint "share_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_id"], name: "index_cg_dm_groups_on_share_id", unique: true
    t.index ["user_id", "pet_id"], name: "index_cg_dm_groups_on_user_id_and_pet_id", unique: true
  end

  create_table "cg_dms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "dm_group_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_evs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "share_id"
    t.integer "val"
    t.bigint "ev_type_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_info_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "info_type_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_pet_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "medical_info", default: 100
    t.integer "fixed_cost"
    t.integer "variable_cost"
    t.text "share_about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_pets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "petname"
    t.bigint "pets_sex_info", default: 100
    t.bigint "type_id"
    t.string "icon", default: "icon/animal/dog_1.png"
    t.text "about"
    t.bigint "share_pet_info", default: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_pets_facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id", "facility_id"], name: "index_cg_pets_facilities_on_pet_id_and_facility_id", unique: true
  end

  create_table "cg_pets_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "info_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_share_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "share_id"
    t.bigint "facility_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "actually_start"
    t.datetime "actually_end"
    t.integer "fixed_cost"
    t.integer "variable_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_shares", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pet_id"
    t.bigint "share_info", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "share_type_info", default: 22
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_user_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.bigint "document_info", default: 100
    t.bigint "credit_info", default: 100
    t.integer "age"
    t.bigint "sex_info", default: 100
    t.bigint "country_info", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "icon", default: "icon/person/b_12.png"
    t.text "about"
    t.bigint "share_user_info", default: 12
    t.bigint "share_host_info", default: 14
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
