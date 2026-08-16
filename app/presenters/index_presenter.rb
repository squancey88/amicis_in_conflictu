class IndexPresenter < ApplicationPresenter
  include Rails.application.routes.url_helpers

  def title
    raise NotImplementedError
  end

  def subtitle
    nil
  end

  def new_label
    "New"
  end

  def new_path
    nil
  end

  def menu_options
    []
  end

  def header_buttons
    [
      {
        label: new_label,
        href: new_path
      }
    ]
  end
end
