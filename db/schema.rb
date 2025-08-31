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

ActiveRecord::Schema[7.1].define(version: 2025_08_31_140540) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "api_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.uuid "created_by_id", null: false
    t.integer "expires_in_days", default: 31
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_api_keys_on_created_by_id"
  end

  create_table "armies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "game_system_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "parent_id"
    t.index ["game_system_id"], name: "index_armies_on_game_system_id"
    t.index ["parent_id"], name: "index_armies_on_parent_id"
  end

  create_table "army_lists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "details"
    t.uuid "army_id"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "campaign_id"
    t.uuid "user_id", null: false
    t.uuid "game_system_id", null: false
    t.jsonb "initial_values"
    t.integer "starting_cost"
    t.index ["army_id"], name: "index_army_lists_on_army_id"
    t.index ["campaign_id"], name: "index_army_lists_on_campaign_id"
    t.index ["game_system_id"], name: "index_army_lists_on_game_system_id"
    t.index ["user_id"], name: "index_army_lists_on_user_id"
  end

  create_table "articles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.uuid "world_id", null: false
    t.integer "visibility", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "world_owner_notes", default: {}
    t.index ["world_id"], name: "index_articles_on_world_id"
  end

  create_table "campaigns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "gaming_group_id", null: false
    t.uuid "game_system_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "config"
    t.integer "list_start_cost"
    t.uuid "world_id"
    t.uuid "game_master_id"
    t.index ["game_master_id"], name: "index_campaigns_on_game_master_id"
    t.index ["game_system_id"], name: "index_campaigns_on_game_system_id"
    t.index ["gaming_group_id"], name: "index_campaigns_on_gaming_group_id"
    t.index ["world_id"], name: "index_campaigns_on_world_id"
  end

  create_table "character_species_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "lifespan"
    t.uuid "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "world_id"], name: "index_character_species_types_on_name_and_world_id", unique: true
    t.index ["world_id"], name: "index_character_species_types_on_world_id"
  end

  create_table "character_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "config", default: {}
    t.index ["name", "world_id"], name: "index_character_types_on_name_and_world_id", unique: true
    t.index ["world_id"], name: "index_character_types_on_world_id"
  end

  create_table "characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "given_name"
    t.string "family_name"
    t.jsonb "physical_description"
    t.uuid "world_id", null: false
    t.uuid "born_during_id"
    t.uuid "character_type_id", null: false
    t.uuid "character_species_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "controlled_by_id"
    t.uuid "campaign_id"
    t.integer "visibility", default: 0
    t.boolean "active", default: true
    t.jsonb "config", default: {}
    t.jsonb "history", default: {}
    t.jsonb "world_owner_notes", default: {}
    t.jsonb "player_notes", default: {}
    t.jsonb "shared_notes", default: {}
    t.string "nickname"
    t.string "title"
    t.index ["born_during_id"], name: "index_characters_on_born_during_id"
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["character_species_type_id"], name: "index_characters_on_character_species_type_id"
    t.index ["character_type_id"], name: "index_characters_on_character_type_id"
    t.index ["controlled_by_id"], name: "index_characters_on_controlled_by_id"
    t.index ["world_id"], name: "index_characters_on_world_id"
  end

  create_table "equipment", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "cost"
    t.boolean "attach_to_list"
    t.boolean "attach_to_unit"
    t.uuid "game_system_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_system_id"], name: "index_equipment_on_game_system_id"
  end

  create_table "equipment_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "equipment_id", null: false
    t.string "attached_to_type", null: false
    t.uuid "attached_to_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attached_to_type", "attached_to_id"], name: "index_equipment_attachments_on_attached_to"
    t.index ["equipment_id"], name: "index_equipment_attachments_on_equipment_id"
  end

  create_table "game_quest_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.uuid "game_id", null: false
    t.uuid "quest_event_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "quest_event_id"], name: "index_game_quest_events_on_game_id_and_quest_event_id", unique: true
    t.index ["game_id"], name: "index_game_quest_events_on_game_id"
    t.index ["quest_event_id"], name: "index_game_quest_events_on_quest_event_id"
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
    t.uuid "campaign_id"
    t.index ["campaign_id"], name: "index_games_on_campaign_id"
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

  create_table "location_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "world_id"], name: "index_location_types_on_name_and_world_id", unique: true
    t.index ["world_id"], name: "index_location_types_on_world_id"
  end

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "description"
    t.jsonb "history"
    t.uuid "located_in_id"
    t.uuid "world_id", null: false
    t.uuid "location_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "world_owner_notes", default: {}
    t.index ["located_in_id"], name: "index_locations_on_located_in_id"
    t.index ["location_type_id"], name: "index_locations_on_location_type_id"
    t.index ["world_id"], name: "index_locations_on_world_id"
  end

  create_table "organisation_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "world_id", null: false
    t.jsonb "config", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_organisation_types_on_world_id"
  end

  create_table "organisations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "world_owner_notes", default: {}
    t.uuid "world_id", null: false
    t.uuid "organisation_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "description", default: {}
    t.jsonb "history", default: {}
    t.index ["organisation_type_id"], name: "index_organisations_on_organisation_type_id"
    t.index ["world_id"], name: "index_organisations_on_world_id"
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

  create_table "quest_event_data", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "quest_event_id", null: false
    t.string "type"
    t.jsonb "data"
    t.integer "order"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_event_id"], name: "index_quest_event_data_on_quest_event_id"
  end

  create_table "quest_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.jsonb "blurb"
    t.uuid "quest_id", null: false
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_quest_events_on_quest_id"
  end

  create_table "quests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.jsonb "blurb"
    t.uuid "world_id", null: false
    t.uuid "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_quests_on_created_by_id"
    t.index ["world_id"], name: "index_quests_on_world_id"
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

  create_table "time_periods", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "order"
    t.uuid "world_id", null: false
    t.string "name"
    t.jsonb "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_time_periods_on_world_id"
  end

  create_table "unit_applied_modifiers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_id", null: false
    t.uuid "game_id"
    t.uuid "unit_stat_modifier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_unit_applied_modifiers_on_game_id"
    t.index ["unit_id"], name: "index_unit_applied_modifiers_on_unit_id"
    t.index ["unit_stat_modifier_id"], name: "index_unit_applied_modifiers_on_unit_stat_modifier_id"
  end

  create_table "unit_stat_changes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_stat_definition_id", null: false
    t.uuid "unit_stat_modifier_id", null: false
    t.integer "stat_change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_stat_definition_id"], name: "index_unit_stat_changes_on_unit_stat_definition_id"
    t.index ["unit_stat_modifier_id"], name: "index_unit_stat_changes_on_unit_stat_modifier_id"
  end

  create_table "unit_stat_definitions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "game_system_id", null: false
    t.string "name"
    t.string "label"
    t.integer "stat_type", default: 0
    t.integer "min"
    t.integer "max"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_system_id"], name: "index_unit_stat_definitions_on_game_system_id"
  end

  create_table "unit_stat_modifiers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "game_system_id", null: false
    t.string "name"
    t.string "description"
    t.integer "cost"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "rich_description"
    t.boolean "repeatable", default: true
    t.integer "repeat_cost", default: 0
    t.boolean "increase_cost_by_additional_instances", default: true
    t.integer "list_cost_increase", default: 0
    t.index ["game_system_id"], name: "index_unit_stat_modifiers_on_game_system_id"
  end

  create_table "unit_stats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_id", null: false
    t.uuid "unit_stat_definition_id", null: false
    t.integer "base_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_unit_stats_on_unit_id"
    t.index ["unit_stat_definition_id"], name: "index_unit_stats_on_unit_stat_definition_id"
  end

  create_table "unit_template_stats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_template_id", null: false
    t.uuid "unit_stat_definition_id", null: false
    t.integer "base_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_stat_definition_id"], name: "index_unit_template_stats_on_unit_stat_definition_id"
    t.index ["unit_template_id"], name: "index_unit_template_stats_on_unit_template_id"
  end

  create_table "unit_template_trait_mappings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_template_id", null: false
    t.uuid "unit_trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_template_id"], name: "index_unit_template_trait_mappings_on_unit_template_id"
    t.index ["unit_trait_id"], name: "index_unit_template_trait_mappings_on_unit_trait_id"
  end

  create_table "unit_templates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.uuid "game_system_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "army_id"
    t.index ["army_id"], name: "index_unit_templates_on_army_id"
    t.index ["game_system_id"], name: "index_unit_templates_on_game_system_id"
  end

  create_table "unit_trait_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "game_system_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_system_id"], name: "index_unit_trait_categories_on_game_system_id"
  end

  create_table "unit_trait_category_mappings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_trait_category_id", null: false
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mapped_to_type"
    t.uuid "mapped_to_id"
    t.index ["mapped_to_type", "mapped_to_id"], name: "index_unit_trait_category_mappings_on_mapped_to"
    t.index ["unit_trait_category_id"], name: "index_unit_trait_category_mappings_on_unit_trait_category_id"
  end

  create_table "unit_trait_mappings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "unit_id", null: false
    t.uuid "unit_trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_unit_trait_mappings_on_unit_id"
    t.index ["unit_trait_id"], name: "index_unit_trait_mappings_on_unit_trait_id"
  end

  create_table "unit_traits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "game_system_id", null: false
    t.uuid "army_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "rich_description"
    t.uuid "unit_trait_category_id"
    t.index ["army_id"], name: "index_unit_traits_on_army_id"
    t.index ["game_system_id"], name: "index_unit_traits_on_game_system_id"
    t.index ["unit_trait_category_id"], name: "index_unit_traits_on_unit_trait_category_id"
  end

  create_table "unit_xp_gain_applieds", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "game_id", null: false
    t.uuid "unit_id", null: false
    t.uuid "unit_xp_gain_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_unit_xp_gain_applieds_on_game_id"
    t.index ["unit_id"], name: "index_unit_xp_gain_applieds_on_unit_id"
    t.index ["unit_xp_gain_event_id"], name: "index_unit_xp_gain_applieds_on_unit_xp_gain_event_id"
  end

  create_table "unit_xp_gain_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "description"
    t.integer "xp_gain"
    t.uuid "game_system_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_system_id"], name: "index_unit_xp_gain_events_on_game_system_id"
  end

  create_table "units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "cost"
    t.jsonb "stats"
    t.jsonb "stat_modifiers"
    t.boolean "active", default: true, null: false
    t.uuid "army_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "starting_xp", default: 0, null: false
    t.index ["army_list_id"], name: "index_units_on_army_list_id"
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
    t.boolean "admin", default: false
    t.string "password_migration_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "world_item_data", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "category"
    t.string "type"
    t.integer "visibility", default: 0
    t.string "relates_to_type", null: false
    t.uuid "relates_to_id", null: false
    t.jsonb "data"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relates_to_type", "relates_to_id"], name: "index_world_item_data_on_relates_to"
  end

  create_table "worlds", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.jsonb "config"
    t.uuid "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "blurb", default: {}
    t.index ["owner_id"], name: "index_worlds_on_owner_id"
  end

  add_foreign_key "api_keys", "users", column: "created_by_id"
  add_foreign_key "armies", "armies", column: "parent_id"
  add_foreign_key "armies", "game_systems"
  add_foreign_key "army_lists", "armies"
  add_foreign_key "army_lists", "game_systems"
  add_foreign_key "army_lists", "users"
  add_foreign_key "articles", "worlds"
  add_foreign_key "campaigns", "game_systems"
  add_foreign_key "campaigns", "gaming_groups"
  add_foreign_key "campaigns", "users", column: "game_master_id"
  add_foreign_key "character_species_types", "worlds"
  add_foreign_key "character_types", "worlds"
  add_foreign_key "characters", "character_species_types"
  add_foreign_key "characters", "character_types"
  add_foreign_key "characters", "time_periods", column: "born_during_id"
  add_foreign_key "characters", "users", column: "controlled_by_id"
  add_foreign_key "characters", "worlds"
  add_foreign_key "equipment", "game_systems"
  add_foreign_key "equipment_attachments", "equipment"
  add_foreign_key "game_quest_events", "games"
  add_foreign_key "game_quest_events", "quest_events"
  add_foreign_key "games", "game_systems"
  add_foreign_key "games", "gaming_sessions"
  add_foreign_key "gaming_sessions", "gaming_groups"
  add_foreign_key "location_types", "worlds"
  add_foreign_key "locations", "location_types"
  add_foreign_key "locations", "locations", column: "located_in_id"
  add_foreign_key "locations", "worlds"
  add_foreign_key "organisation_types", "worlds"
  add_foreign_key "organisations", "organisation_types"
  add_foreign_key "organisations", "worlds"
  add_foreign_key "player_armies", "armies"
  add_foreign_key "player_armies", "army_lists"
  add_foreign_key "player_armies", "players"
  add_foreign_key "players", "games"
  add_foreign_key "quest_event_data", "quest_events"
  add_foreign_key "quest_events", "quests"
  add_foreign_key "quests", "users", column: "created_by_id"
  add_foreign_key "quests", "worlds"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "gaming_groups"
  add_foreign_key "time_periods", "worlds"
  add_foreign_key "unit_applied_modifiers", "games"
  add_foreign_key "unit_applied_modifiers", "unit_stat_modifiers"
  add_foreign_key "unit_applied_modifiers", "units"
  add_foreign_key "unit_stat_changes", "unit_stat_definitions"
  add_foreign_key "unit_stat_changes", "unit_stat_modifiers"
  add_foreign_key "unit_stat_definitions", "game_systems"
  add_foreign_key "unit_stat_modifiers", "game_systems"
  add_foreign_key "unit_stats", "unit_stat_definitions"
  add_foreign_key "unit_stats", "units"
  add_foreign_key "unit_template_stats", "unit_stat_definitions"
  add_foreign_key "unit_template_stats", "unit_templates"
  add_foreign_key "unit_template_trait_mappings", "unit_templates"
  add_foreign_key "unit_template_trait_mappings", "unit_traits"
  add_foreign_key "unit_templates", "armies"
  add_foreign_key "unit_templates", "game_systems"
  add_foreign_key "unit_trait_categories", "game_systems"
  add_foreign_key "unit_trait_category_mappings", "unit_trait_categories"
  add_foreign_key "unit_trait_mappings", "unit_traits"
  add_foreign_key "unit_trait_mappings", "units"
  add_foreign_key "unit_traits", "armies"
  add_foreign_key "unit_traits", "game_systems"
  add_foreign_key "unit_traits", "unit_trait_categories"
  add_foreign_key "unit_xp_gain_applieds", "games"
  add_foreign_key "unit_xp_gain_applieds", "unit_xp_gain_events"
  add_foreign_key "unit_xp_gain_applieds", "units"
  add_foreign_key "unit_xp_gain_events", "game_systems"
  add_foreign_key "units", "army_lists"
  add_foreign_key "worlds", "users", column: "owner_id"
end
