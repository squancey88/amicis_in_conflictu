class JsonSchema
  def initialize
    @properties = {}
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

  class ItemList
    attr_reader :data

    def initialize
      @data = {}
    end

    def add_item(name, type, **extras)
      @data[name] = {type:}.merge(extras)
    end
  end
end
