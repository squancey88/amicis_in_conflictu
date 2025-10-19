class UserSerializer < BaseSerializer
  private

  def columns
    %i[email display_name]
  end
end
