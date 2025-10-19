class WorldSerializer < BaseSerializer
  private

  def columns
    %i[name blurb]
  end
end
