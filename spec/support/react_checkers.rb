module ReactCheckers
  def props_for(rendered_content, component_name)
    doc = Nokogiri::HTML(rendered_content)
    node = doc.at_css("[data-react-component='#{component_name}']")
    JSON.parse(node["data-props"])
  end

  def all_props_for(rendered_content, component_name)
    doc = Nokogiri::HTML(rendered_content)
    doc.css("[data-react-component='#{component_name}']").map do |node|
      JSON.parse(node["data-props"])
    end
  end
end

RSpec::Matchers.define :have_component_with_props do |component_name, expected_props|
  match do |rendered_content|
    doc = Nokogiri::HTML(rendered_content)
    nodes = doc.css("[data-react-component='#{component_name}']")

    nodes.any? do |node|
      actual_props = JSON.parse(node["data-props"])
      expected_props.all? { |key, value| actual_props[key.to_s] == value }
    end
  end

  failure_message do |rendered_content|
    doc = Nokogiri::HTML(rendered_content)
    nodes = doc.css("[data-react-component='#{component_name}']")

    if nodes.empty?
      "expected to find a #{component_name} component but none was rendered"
    else
      actual = nodes.map { |n| JSON.parse(n["data-props"]) }
      "expected a #{component_name} component with props #{expected_props} but found #{actual}"
    end
  end
end
