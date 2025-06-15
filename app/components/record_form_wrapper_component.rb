# frozen_string_literal: true

class RecordFormWrapperComponent < ViewComponent::Base
  delegate :grid_classes, to: :helpers

  renders_one :menu_items
  renders_many :form_boxes, "FormBoxComponent"
  renders_one :tab_section, Common::TabsSectionComponent
  renders_many :notices, "FormNoticeComponent"

  def initialize(record:, form:, title: nil, row_cols: 2)
    @record = record
    @form = form
    @title = title
    @row_cols = row_cols
  end

  def title
    return @title if @title
    return prefix if @record.new_record?
    "#{prefix} - #{@record}"
  end

  def prefix
    @record.new_record? ? "New" : "Edit"
  end

  def subtitle
    @record.class.model_name.human
  end

  class FormNoticeComponent < ViewComponent::Base
    def initialize(notice: nil)
      @notice = notice
    end

    def render?
      @notice.present?
    end

    def call
      content_tag :div, @notice
    end
  end

  class FormBoxComponent < ViewComponent::Base
    def initialize(title: nil)
      @title = title
    end

    def call
      content_tag :div, class: %i[record-form-wrapper__box col] do
        content_tag :div, class: %i[card text-bg-light] do
          content_tag(:div, class: "record-form-wrapper__box-content card-body") do
            concat(content_tag(:h5, @title, class: "record-form-wrapper__box-title card-title")) if @title
            concat(content)
          end
        end
      end
    end
  end
end
