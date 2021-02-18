describe Player do
  subject { described_class.new('Frank') }
  let(:player) { instance_double(Player, take_damage: nil) }

  describe '#name' do
    it 'returns player name' do
      expect(subject.name).to eq 'Frank'
    end
  end

  describe '#hp' do
    it 'returns player hp' do
      expect(subject.hit_points).to be 100
    end
  end

  describe '#take_damage' do
    it 'reduces hp by 10' do
      expect { subject.take_damage }.to change { subject.hit_points }.by -10
    end
  end
end