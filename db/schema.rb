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

ActiveRecord::Schema[7.0].define(version: 2023_08_01_200837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.integer "game_mode", null: false
    t.integer "platform", null: false
    t.string "platform_indentification", null: false
    t.integer "years_playing"
    t.integer "favorite_classes"
    t.integer "hour_start"
    t.integer "hour_end"
    t.boolean "voice_channel", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_indentification"], name: "index_ads_on_platform_indentification", unique: true
  end

end
