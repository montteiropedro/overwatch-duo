# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_18_144903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "ads", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "platform", null: false
    t.string "platform_indentification", null: false
    t.integer "years_playing"
    t.integer "favorite_classes"
    t.integer "hour_start"
    t.integer "hour_end"
    t.boolean "voice_channel", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "game_mode_id", null: false
    t.uuid "user_id", null: false
    t.integer "user_rank"
    t.index ["game_mode_id"], name: "index_ads_on_game_mode_id"
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "game_modes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "provider"
    t.string "discord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "discord_user", null: false
    t.index ["discord_id"], name: "index_users_on_discord_id", unique: true
    t.index ["discord_user"], name: "index_users_on_discord_user", unique: true
  end

  add_foreign_key "ads", "game_modes"
  add_foreign_key "ads", "users"
end
