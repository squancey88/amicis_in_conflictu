require "rails_helper"

RSpec.describe GamingGroup, type: :model do
  let(:gaming_group) { create(:gaming_group, name: "Test") }

  let(:owner) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: true)
    user
  }

  let(:member) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: false)
    user
  }

  let(:not_member) { create(:user) }

  context "associations" do
    it { should have_many(:user_group_memberships) }
    it { should have_many(:users) }
    it { should have_many(:teams) }
    it { should have_many(:gaming_sessions) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "attributes" do
    it { expect(gaming_group).to have_attributes(name: "Test") }
  end

  it "should return members correctly" do
    expect(gaming_group.members).to eq([member])
  end

  it "should return owners correctly" do
    expect(gaming_group.owners).to eq([owner])
  end

  it "should correctly return for is_owner?" do
    expect(gaming_group.is_owner?(owner)).to be true
    expect(gaming_group.is_owner?(member)).to be false
  end

  it "should correctly return for is_user?" do
    expect(gaming_group.is_user?(owner)).to be true
    expect(gaming_group.is_user?(member)).to be true
    expect(gaming_group.is_user?(not_member)).to be false
  end

  describe "scoring" do
    let(:wargame) { create(:wargame, :turn_based) }
    let(:gaming_session) { create(:gaming_session, gaming_group:) }
    let(:game1) { create(:game, user_list: gaming_group.users, game_system: wargame, gaming_session:) }
    let(:game2) { create(:game, user_list: gaming_group.users, game_system: wargame, gaming_session:) }
    let(:player1_1) { game1.players.first }
    let(:player1_2) { game1.players.last }
    let(:player2_1) { game2.players.first }
    let(:player2_2) { game2.players.last }

    before do
      owner
      member
      player1_1.turns = [
        {primary: 5, secondary: 3},
        {primary: 3, secondary: 0}
      ]
      player1_1.save!

      player1_2.turns = [
        {primary: 10, secondary: 5},
        {primary: 3, secondary: 8}
      ]
      player1_2.save!
      game1.game_state = :finished
      game1.save!

      player2_1.turns = [
        {primary: 5, secondary: 3},
        {primary: 3, secondary: 0}
      ]
      player2_1.save!

      player2_2.turns = [
        {primary: 5, secondary: 3},
        {primary: 3, secondary: 0}
      ]
      player2_2.save!
      game2.game_state = :finished
      game2.save!
    end

    describe "by_player" do
      before do
        @result_data = gaming_group.results_by_player
      end
      it "should return array of player results matching number of users" do
        expect(@result_data.count).to eq gaming_group.users.count
      end

      it "should show one win for player2" do
        user2 = player1_2.controller
        player_results = @result_data.filter { _1[0] == user2 }.first
        expect(player_results[1]).to eq 1
        user1 = player1_1.controller
        player_results = @result_data.filter { _1[0] == user1 }.first
        expect(player_results[3]).to eq 1
      end
    end
  end
end
