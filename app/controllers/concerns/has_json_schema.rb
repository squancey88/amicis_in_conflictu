module HasJsonSchema
  extend ActiveSupport::Concern

  included do
    prepend_before_action :process_config_string, only: [:create, :update]
  end

  class_methods do
    @@configs ||= []

    def has_json_config name
      @@configs << name
    end
  end

  private

  def param_name(name)
    "#{name}_json_string"
  end

  def controller_name_with_namespace
    controller_path.singularize.tr("/", "_")
  end

  def process_config_string
    @@configs.each do |name|
      if params[controller_name_with_namespace][param_name(name)]
        params[controller_name_with_namespace][name] = JSON.parse(
          params[controller_name_with_namespace.singularize][param_name(name)]
        )
      end
    end
  end
end
