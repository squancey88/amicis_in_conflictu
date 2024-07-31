# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

GameSystems::Wargame.find_or_initialize_by(slug: "warhammer-40k-10th-ed").tap do |gs|
  gs.name = "Warhammer 40k"
  gs.edition = "10th"
  gs.competitive = true
  gs.has_armies = true
  gs.has_army_lists = true
  gs.game_config = {
    scoring_system: :turn_based,
    finish_reasons: [
      "Game End",
      "Army Wipe",
      "Player Surrender"
    ],
    scoring_name: "VP",
    turn_data: [
      {
        key: :primary,
        name: "Primary",
        type: :number,
        scoring: true
      },
      {
        key: :secondary,
        name: "Secondary",
        type: :number,
        scoring: true
      }
    ]
  }
end.save!

GameSystems::Wargame.find_or_initialize_by(slug: "legions-imperialis-1st-ed").tap do |gs|
  gs.name = "Legions Imperialis"
  gs.edition = "1st"
  gs.competitive = true
  gs.has_armies = true
  gs.has_army_lists = true
  gs.game_config = {
    scoring_system: :turn_based,
    finish_reasons: [
      "Game End",
      "Army Wipe",
      "Player Surrender"
    ],
    scoring_name: "VP",
    turn_data: [
      {
        key: :primary,
        name: "Primary",
        type: :number,
        scoring: true
      }
    ]
  }
end.save!

GameSystems::Wargame.find_or_initialize_by(slug: "underworlds").tap do |gs|
  gs.name = "Underworlds"
  gs.edition = "Current"
  gs.competitive = true
  gs.has_armies = true
  gs.game_config = {
    scoring_system: :turn_based,
    finish_reasons: [
      "Game End"
    ],
    scoring_name: "Glory",
    turn_data: [
      {
        key: :objectives,
        name: "Objectives",
        type: :number,
        scoring: true
      },
      {
        key: :kills,
        name: "Kills",
        type: :number,
        scoring: true
      }
    ]
  }
end.save!

GameSystems::Wargame.find_or_initialize_by(slug: "aos-spearhead-4th").tap do |gs|
  gs.name = "AOS - Spearhead"
  gs.edition = "4th"
  gs.competitive = true
  gs.has_armies = true
  gs.game_config = {
    scoring_system: :turn_based,
    finish_reasons: [
      "Game End"
    ],
    scoring_name: "VP",
    turn_data: [
      {
        key: :objectives,
        name: "Objectives",
        type: :number,
        scoring: true
      },
      {
        key: :battle_tactics,
        name: "Battle Tactics",
        type: :number,
        scoring: true
      },
      {
        key: :twist,
        name: "Twist",
        type: :number,
        scoring: true
      }
    ]
  }
end.save!
