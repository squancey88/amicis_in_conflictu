class GamingSessionSerializer < BaseSerializer
  private

  def columns
    %i[start_time]
  end
end
