# frozen_string_literal: true

describe Player do
  subject      { described_class.new('Frank') }
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
    it 'reduces hp by random amount' do
      allow_any_instance_of(Object).to receive(:rand) { 20 }
      expect { subject.take_damage }.to change { subject.hit_points }.by(-20)
    end
  end

  describe '#dead?' do
    it 'returns true when hp == 0' do
      allow(subject).to receive(:hit_points) { 0 }
      expect(subject).to be_dead
    end

    it 'returns true when hp less than 0' do
      allow(subject).to receive(:hit_points) { -1 }
      expect(subject).to be_dead
    end

    it 'returns true when hp is above 0' do
      allow(subject).to receive(:hit_points) { 1 }
      expect(subject).not_to be_dead
    end
  end
end
