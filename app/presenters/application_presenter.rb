class ApplicationPresenter
  def initialize(view_context, record)
    @view_context = view_context
    @record = record
  end

  private

  attr_accessor :view_context, :record
end
