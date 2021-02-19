describe Game do
  let(:player_1) { instance_double(Player, take_damage: nil) }
  let(:player_2) { instance_double(Player, take_damage: nil) }
  subject        { described_class.new(player_1, player_2) }

  describe '#attack' do
    it 'reduces hp' do
      expect(player_1).to receive :take_damage
      subject.attack(player_1)
    end
  end

  describe '#player_1' do
    it 'returns player 1' do
      expect(subject.player_1).to be player_1
    end
  end

  describe '#player_2' do
    it 'returns player 2' do
      expect(subject.player_2).to be player_2
    end
  end
end