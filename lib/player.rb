class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = 100
  end

  def take_damage
    self.hp -= 10
  end

  private

  attr_writer :hp
end