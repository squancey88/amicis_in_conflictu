class GamingSessionSerializer < BaseSerializer
  private

  def columns
    %i[start_time]
  end

  def additional_values(item)
    {}
  end
end
