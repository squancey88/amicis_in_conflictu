class ChangeWorldTimePeriodToGenericConfigAttribute < ActiveRecord::Migration[7.1]
  def change
    rename_column :worlds, :time_period_config, :config

    World.find_each do |world|
      time_period_config = world.config
      world.config = {
        time_period_config: time_period_config
      }
      world.save!
    end
  end
end
