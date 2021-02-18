class Player
  attr_reader :name, :hp

  DEFAULT_HP = 100

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def take_damage
    self.hp -= 10
  end

  def attack(player)
    player.take_damage
  end

  private

  attr_writer :hp
end