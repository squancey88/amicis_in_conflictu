module HasGameConfig
  extend ActiveSupport::Concern

  included do
    self.game_config_schema = GameConfigSchema.new
  end

  class_methods do
    attr_accessor :game_config_schema

    def config_has_scoring_systems(*types)
      game_config_schema.add_enum_property(:scoring_system, types, true)
      store_accessor :game_config, :scoring_system
      game_config_schema.add_string_property(:scoring_name, true)
    end

    def config_has_turn_data(title:, point_title: nil, &block)
      game_config_schema.add_array_property(
        :turn_data,
        true,
        game_schema_object(title: point_title, &block),
        title:
      )
      store_accessor :game_config, :turn_data
    end

    def config_has_health(required: true)
      game_config_schema.add_boolean_property(:has_health, required)
      store_accessor :game_config, :has_health
    end

    def config_has_timed_turns(required: true)
      game_config_schema.add_boolean_property(:has_timed_turns, required)
      store_accessor :game_config, :has_timed_turns
    end

    def config_has_campaign_list_attributes(&block)
      game_config_schema.add_array_property(
        :campaign_list_attributes,
        true,
        game_schema_object(title: "Attribute", &block),
        title: "Campaign Attributes"
      )
      store_accessor :game_config, :campaign_list_attributes
    end

    def game_schema_object(title:, &block)
      items = ItemList.new
      block.call(items)
      obj = {
        type: :object,
        properties: items.data
      }
      obj[:title] = title if title
      obj
    end

    def schema
      game_config_schema.generate_schema
    end
  end

  class ItemList
    attr_reader :data

    def initialize
      @data = {}
    end

    def add_item(name, type, **extras)
      @data[name] = {type:}.merge(extras)
    end
  end

  class GameConfigSchema
    def initialize
      @properties = {}
      add_array_property(:finish_reasons, true,
        {
          title: "Reason",
          type: :string
        },
        title: "Finish Reasons")
    end

    def add_array_property(name, required, items, title: nil)
      extras = {items:}
      extras[:title] = title if title
      add_property(name, :array, required, **extras)
    end

    def add_string_property(name, required)
      add_property(name, :string, required)
    end

    def add_boolean_property(name, required)
      add_property(name, :boolean, required)
    end

    def add_enum_property(name, values, required)
      add_property(name, :string, required, enum: values)
    end

    def generate_schema
      {
        title: "Config",
        type: :object,
        properties: @properties
      }
    end

    def add_property(name, type, required, **extras)
      @properties[name] = {
        type:, required:
      }.merge(extras)
    end
  end
end
