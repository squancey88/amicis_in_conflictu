class GamingGroupSerializer < BaseSerializer
  private

  def columns
    %i[name]
  end

  def additional_values(item)
    {
      members: item.members.map { UserSerializer.new(_1).serialize },
      owners: item.owners.map { UserSerializer.new(_1).serialize }
    }
  end
end
