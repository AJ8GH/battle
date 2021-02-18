describe Player do
  subject { described_class.new('Frank') }

  describe '#name' do
    it 'returns player name' do
      expect(subject.name).to eq 'Frank'
    end
  end

  describe '#hp' do
    it 'returns player hp' do
      expect(subject.hp).to be 100
    end
  end

  describe '#take_damage' do
    it 'reduces hp by 10' do
      subject.take_damage
      expect(subject.hp).to be 90
    end
  end
end