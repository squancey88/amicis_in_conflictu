# temp presenter to handle form migration
class FormPresenter < ShowPresenter
  def initialize(view_context, record, title:)
    super(view_context, record)
    @title = title
  end

  def subtitle
    record.class.model_name.human
  end

  def title
    return @title if @title
    return prefix if @record.new_record?
    "#{prefix} - #{@record}"
  end

  def prefix
    @record.new_record? ? "New" : "Edit"
  end
end
