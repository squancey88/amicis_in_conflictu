module ApplicationHelper
  include Pagy::Frontend

  def column_row_classes
    %i[row row-cols-1 row-cols-md-2 g-2]
  end

  def column_row_class
    column_row_classes.join(" ")
  end

  def simple_text_to_rich(text)
    {
      time: DateTime.now.to_i,
      version: "2.29.1",
      blocks: [
        {
          type: :paragraph,
          data: {
            text:
          },
          id: SecureRandom.base64(10)
        }
      ]
    }.to_json
  end

  def precedence_select(form, attribute)
    form.select(attribute, options_for_select(Precedence.map.map { |k, v| [v.titlecase, k] }),
      {include_blank: "Please Select"}, {class: "form-select"})
  end

  def span_to_aic_grid_class(span)
    case span&.to_sym
    when :full
      "full"
    end
  end

  def react_component(name, props)
    content_tag :div, nil, data: {
      react_component: name,
      props: props.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    }
  end
end
