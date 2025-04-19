unless Rails.application.config.eager_load
  Rails.application.config.to_prepare do
    Rails.logger.info("Preloading game systems")
    Rails.autoloaders.main.eager_load_dir(Rails.root.join("app/models/game_systems"))
    Rails.autoloaders.main.eager_load_dir(Rails.root.join("app/models/world_item_data"))
  end
end
