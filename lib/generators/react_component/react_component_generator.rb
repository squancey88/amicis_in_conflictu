class ReactComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  class_option :type, type: :string, default: nil,
    desc: "Component type: atom, molecule, or organism"

  COMPONENT_TYPES = %w[atom molecule organism].freeze

  def create_component_files
    template "component.tsx.tt", "app/javascript/components/#{component_type.pluralize}/#{class_name}/#{class_name}.tsx"
    template "component.test.tsx.tt", "app/javascript/components/#{component_type.pluralize}/#{class_name}/#{class_name}.test.tsx"
    template "index.ts.tt", "app/javascript/components/#{component_type.pluralize}/#{class_name}/index.ts"
  end

  private

  def component_type
    return validated_option_type if options[:type].present?
    prompt_for_type
  end

  def validated_option_type
    type = options[:type].downcase
    unless COMPONENT_TYPES.include?(type)
      raise Thor::Error, "Invalid type '#{type}'. Must be one of: #{COMPONENT_TYPES.join(", ")}"
    end
    type
  end

  def prompt_for_type
    ask("Component type?", limited_to: COMPONENT_TYPES)
  end
end
