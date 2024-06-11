module ApplicationHelper
  def column_row_classes
    %i[row row-cols-1 row-cols-md-2 g-2]
  end

  def column_row_class
    column_row_classes.join(" ")
  end
end
