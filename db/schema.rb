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

ActiveRecord::Schema[7.1].define(version: 2024_06_11_192016) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "armies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "game_system_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_system_id"], name: "index_armies_on_game_system_id"
    t.index ["user_id"], name: "index_armies_on_user_id"
  end

  create_table "army_lists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "details"
    t.uuid "army_id", null: false
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_id"], name: "index_army_lists_on_army_id"
  end

  create_table "game_systems", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.jsonb "game_config"
    t.boolean "competitive"
    t.string "edition"
    t.string "slug"
    t.boolean "has_armies", default: false
    t.boolean "has_army_lists", default: false
    t.index ["slug"], name: "index_game_systems_on_slug", unique: true
  end

  create_table "games", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "game_system_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "gaming_session_id", null: false
    t.jsonb "data"
    t.jsonb "notes"
    t.integer "game_state", default: 0
    t.string "finish_reason"
    t.index ["game_system_id"], name: "index_games_on_game_system_id"
    t.index ["gaming_session_id"], name: "index_games_on_gaming_session_id"
  end

  create_table "gaming_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gaming_sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "start_time"
    t.uuid "gaming_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "notes"
    t.index ["gaming_group_id"], name: "index_gaming_sessions_on_gaming_group_id"
  end

  create_table "player_armies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "player_id", null: false
    t.uuid "army_id", null: false
    t.uuid "army_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_id"], name: "index_player_armies_on_army_id"
    t.index ["army_list_id"], name: "index_player_armies_on_army_list_id"
    t.index ["player_id"], name: "index_player_armies_on_player_id"
  end

  create_table "players", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "controller_type"
    t.uuid "controller_id"
    t.jsonb "game_data"
    t.jsonb "notes"
    t.integer "result", default: 0
    t.boolean "surrendered", default: false
    t.index ["controller_type", "controller_id"], name: "index_players_on_controller"
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "team_members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "gaming_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gaming_group_id"], name: "index_teams_on_gaming_group_id"
  end

  create_table "user_group_memberships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "gaming_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "owner", default: false
    t.index ["gaming_group_id"], name: "index_user_group_memberships_on_gaming_group_id"
    t.index ["user_id", "gaming_group_id"], name: "index_user_group_memberships_on_user_id_and_gaming_group_id", unique: true
    t.index ["user_id"], name: "index_user_group_memberships_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "surname"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.uuid "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "armies", "game_systems"
  add_foreign_key "armies", "users"
  add_foreign_key "army_lists", "armies"
  add_foreign_key "games", "game_systems"
  add_foreign_key "games", "gaming_sessions"
  add_foreign_key "gaming_sessions", "gaming_groups"
  add_foreign_key "player_armies", "armies"
  add_foreign_key "player_armies", "army_lists"
  add_foreign_key "player_armies", "players"
  add_foreign_key "players", "games"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "gaming_groups"
end
