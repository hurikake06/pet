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

ActiveRecord::Schema.define(version: 2018_10_31_052337) do

  create_table "cg_info_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "info_types_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_pets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.string "name"
    t.string "petname"
    t.bigint "types_id"
    t.text "about"
    t.bigint "share_pet_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_shares", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "pets_id"
    t.bigint "share_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_user_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.bigint "document_info"
    t.bigint "credit_info"
    t.integer "age"
    t.bigint "sex_info"
    t.bigint "country_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cg_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password"
    t.text "about"
    t.bigint "share_user_info"
    t.bigint "share_host_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
