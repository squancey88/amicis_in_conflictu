class AICFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options = {})
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, options.except(:label).merge(class: "form-control"))
    end
  end

  def number_field(attribute, options = {})
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, options.except(:label).merge(class: "form-control"))
    end
  end

  def password_field(attribute, options = {})
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, options.except(:label).merge(class: "form-control"))
    end
  end

  def email_field(attribute, options = {})
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, options.except(:label).merge(class: "form-control"))
    end
  end

  def check_box(attribute, options = {})
    field_wrapper(attribute, [], options, label_class: "mx-1") do
      super(attribute, options)
    end
  end

  def label(attribute, content_or_options = nil, options = {}, &block)
    super
  end

  def select(attribute, choices, options = {}, html_options = {})
    html_options = html_options.merge(class: @template.class_names("form-select", html_options[:class]))
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, choices, options, html_options)
    end
  end

  def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
    html_options = html_options.merge(class: @template.class_names("form-select", html_options[:class]))
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, collection, value_method, text_method, options, html_options)
    end
  end

  def grouped_collection_select(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
    html_options = html_options.merge(class: @template.class_names("form-select", html_options[:class]))
    field_wrapper(attribute, ["form-floating"], options) do
      super(attribute, collection, group_method, group_label_method, option_key_method, option_value_method, options, html_options)
    end
  end

  def submit(label = nil, options = {})
    super
  end

  def fields_for(record_name, record_object = nil, fields_options = {}, &block)
    fields_options[:builder] ||= self.class
    super
  end

  private

  def field_wrapper(attribute, classes, options, label_class: nil, margin_bottom: 3, &block)
    @template.content_tag :div, class: classes + ["mb-#{margin_bottom}"] do
      block.call + label_generator(attribute, options, label_class)
    end
  end

  def label_generator(attribute, options, label_class)
    if options[:label].present?
      label(options[:label].parameterize, options[:label], class: label_class)
    else
      label(attribute, class: label_class)
    end
  end
end
