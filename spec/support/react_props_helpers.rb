module ReactPropsHelpers
  def react_props(serializer_output)
    data = serializer_output.as_json
    data = data.is_a?(Array) ? data.map { normalize(_1) } : normalize(data)
    JSON.parse(data.to_json)
  end

  private

  def normalize(hash)
    hash.deep_transform_keys { |k| k.to_s.camelize(:lower) }
      .deep_transform_values { |v| v.respond_to?(:iso8601) ? v.iso8601(3) : v }
  end
end
