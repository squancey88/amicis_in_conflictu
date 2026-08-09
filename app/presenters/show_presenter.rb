class ShowPresenter < ApplicationPresenter
  def title
    record.to_s
  end

  def subtitle
    nil
  end

  def menu_options
    []
  end
end
