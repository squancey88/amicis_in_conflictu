class UserSerializer < BaseSerializer
  private

  def columns
    %i[email display_name]
  end

  def additional_values(item)
    {}
  end
end
