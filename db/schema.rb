# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_06_090731) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "record_type"
    t.bigint "record_id"
    t.bigint "blob_id"
    t.datetime "created_at"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key"
    t.string "filename"
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size"
    t.string "checksum"
    t.datetime "created_at"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "candidates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "budget_id", null: false
    t.string "night", null: false
    t.string "destination", null: false
    t.text "reason"
    t.integer "transportation_id"
    t.integer "take_time"
    t.string "trans_cost"
    t.boolean "decision"
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_candidates_on_group_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "day_hows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "passed", null: false
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_day_hows_on_plan_id"
    t.index ["user_id"], name: "index_day_hows_on_user_id"
  end

  create_table "dictionaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "language", null: false
    t.string "japanese", null: false
    t.string "translation", null: false
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_dictionaries_on_group_id"
    t.index ["plan_id"], name: "index_dictionaries_on_plan_id"
    t.index ["user_id"], name: "index_dictionaries_on_user_id"
  end

  create_table "goods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_goods_on_candidate_id"
    t.index ["user_id"], name: "index_goods_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "departure_day", null: false
    t.date "return_day", null: false
    t.string "title", null: false
    t.integer "transportation_id"
    t.text "trans_memo"
    t.string "hotel"
    t.text "hotel_memo"
    t.text "bext"
    t.text "happening"
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_memories_on_plan_id"
    t.index ["user_id"], name: "index_memories_on_user_id"
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "destination", null: false
    t.date "departure_day"
    t.date "return_day"
    t.string "hotel"
    t.text "hotel_memo"
    t.integer "transportation_id"
    t.string "start_place"
    t.text "ticket"
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.bigint "candidate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_plans_on_candidate_id"
    t.index ["group_id"], name: "index_plans_on_group_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hour_id"
    t.string "minute_id"
    t.text "program", null: false
    t.integer "category_id"
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.bigint "day_how_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_ID", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "candidates", "groups"
  add_foreign_key "candidates", "users"
  add_foreign_key "day_hows", "plans"
  add_foreign_key "day_hows", "users"
  add_foreign_key "dictionaries", "groups"
  add_foreign_key "dictionaries", "plans"
  add_foreign_key "dictionaries", "users"
  add_foreign_key "goods", "candidates"
  add_foreign_key "goods", "users"
  add_foreign_key "memories", "plans"
  add_foreign_key "memories", "users"
  add_foreign_key "plans", "candidates"
  add_foreign_key "plans", "groups"
  add_foreign_key "plans", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
end
