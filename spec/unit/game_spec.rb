describe Game do
  let(:player_1) { instance_double(Player, take_damage: nil, name: 'Frank') }
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

  describe '#current_player' do
    it 'returns current player' do
      expect(subject.current_player).to be player_1
    end
  end

  describe '#other_player' do
    it 'returns the other player' do
      expect(subject.other_player).to be player_2
    end
  end

  describe '#switch_turns' do
    it 'changes the current player' do
      subject.switch_turns
      expect(subject.current_player).to be player_2
    end

    it 'after 2 turns, changes current player back to player 1' do
      2.times { subject.switch_turns }
      expect(subject.current_player).to be player_1
    end

    it 'changes the other player' do
      subject.switch_turns
      expect(subject.other_player).to be player_1
    end

    it 'after 2 turns, changes other player back to player 2' do
      2.times { subject.switch_turns }
      expect(subject.other_player).to be player_2
    end
  end

  describe '#lose_message' do
    it 'declares current player lost if they are dead' do
      allow(player_1).to receive(:dead?) { true }
      expect(subject.lose_message).to eq "Frank lost!"
    end
  end
end
