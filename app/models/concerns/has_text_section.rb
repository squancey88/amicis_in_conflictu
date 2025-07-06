module HasTextSection
  extend ActiveSupport::Concern

  included do
    class_attribute :text_sections

    self.text_sections = []

    before_validation :process_text_blocks

    def method_missing(method_name, *args, &block)
      match = method_name.to_s.match(/\A(\w+)_plain_text\z/)
      if match
        base_name = match[1]
        if self.class.valid_text_section?(base_name)
          return as_plain_text(base_name)
        end
      end
      super
    end

    def respond_to_missing?(method_name, include_private = false)
      match = method_name.to_s.match(/\A(\w+)_plain_text\z/)
      match && self.class.valid_text_section?(match[1]) || super
    end

    def as_plain_text(name)
      data = send(name)
      return "" unless data["blocks"]

      data["blocks"].filter_map do |block|
        case block["type"]
        when "paragraph"
          ActionController::Base.helpers.strip_tags(block["data"]["text"])
        end
      end.join(" ")
    end
  end

  class_methods do
    def valid_text_section?(name)
      text_sections.include?(name.to_sym)
    end

    def register_text_section(*names)
      self.text_sections += names.map { _1.to_sym }
    end
  end

  def process_text_blocks
    self.class.text_sections.each do |text_section|
      input_data = send(text_section)
      if input_data&.instance_of?(String) && input_data.present?
        send(:"#{text_section}=", JSON.parse(input_data))
      end
    end
  end
end
