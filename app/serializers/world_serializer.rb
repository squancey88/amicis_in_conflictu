class WorldSerializer < BaseSerializer
  private

  def columns
    %i[id name blurb]
  end
end
