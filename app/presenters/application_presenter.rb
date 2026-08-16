class ApplicationPresenter
  def initialize(view_context)
    @view_context = view_context
  end

  private

  attr_accessor :view_context
end
