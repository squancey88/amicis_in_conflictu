class ShowPresenter < ApplicationPresenter
  include Rails.application.routes.url_helpers

  def initialize(view_context, record)
    super(view_context)
    @record = record
  end

  def title
    record.to_s
  end

  def subtitle
    nil
  end

  def menu_options
    options = []
    if edit_path
      options << {
        text: "Edit",
        link: edit_path
      }
    end
    if record_path && can_delete?
      options << {
        text: "Delete",
        link: record_path,
        data: {turbo_method: :delete, turbo_confirm: "Are you sure?"}
      }
    end
    options
  end

  def header_buttons
    []
  end

  private

  attr_accessor :record

  def edit_path
    nil
  end

  def record_path
    nil
  end

  def can_delete?
    false
  end
end
