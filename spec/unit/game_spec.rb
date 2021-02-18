describe Game do
  let(:player) { instance_double(Player, take_damage: nil) }

  describe '#attack' do
    it 'reduces hp' do
      expect(player).to receive :take_damage
      subject.attack(player) 
    end
  end
end