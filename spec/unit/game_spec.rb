describe Game do
  let(:player_1) { instance_double(Player, take_damage: nil, name: 'Frank') }
  let(:player_2) { instance_double(Player, take_damage: nil, name: 'Abigail') }
  subject        { described_class.new(player_1, player_2) }

  describe '.create' do
    it 'creates a new instance of game' do
      expect(described_class.create(player_1, player_2)).to be_a(described_class)
    end
  end

  describe '.instance' do
    it 'returns the instance stored by .create' do
      game = described_class.create(player_1, player_2)
      expect(described_class.instance).to be game
    end
  end

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

  describe '#turn_message' do
    it 'declares current player turn' do
      expect(subject.turn_message).to eq "Frank's turn"
    end

    it 'works for other player too' do
      subject.switch_turns
      expect(subject.turn_message).to eq "Abigail's turn"
    end
  end

  describe '#game_over?' do
    it 'returns true if player 1 is dead' do
      allow(player_1).to receive(:dead?) { true }
      allow(player_2).to receive(:dead?) { false }
      expect(subject).to be_game_over
    end

    it 'returns true if player 2 is dead' do
      allow(player_2).to receive(:dead?) { true }
      allow(player_1).to receive(:dead?) { false }
      expect(subject).to be_game_over
    end

    it 'returns false if both playes alive' do
      allow(player_2).to receive(:dead?) { false }
      allow(player_1).to receive(:dead?) { false }
      expect(subject).not_to be_game_over
    end
  end

  describe '#losing_message' do
    it 'states the current player lost if they are dead' do
      allow(player_1).to receive(:dead?) { true }
      allow(player_2).to receive(:dead?) { false }
      expect(subject.losing_message).to eq 'Frank lost!'
    end

    it 'states the other player lost if they are dead' do
      allow(player_2).to receive(:dead?) { true }
      allow(player_1).to receive(:dead?) { false }
      expect(subject.losing_message).to eq 'Abigail lost!'
    end
  end
end
