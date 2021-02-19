class Game
  attr_reader :player_1, :player_2, :current_player

  def initialize(player_1, player_2)
    @player_1       = player_1
    @player_2       = player_2
    @current_player = player_1
  end

  def attack(player)
    player.take_damage
  end

  def switch_turns
    if current_player == player_1
      self.current_player = player_2
    else
      self.current_player = player_1
    end
  end

  private

  attr_writer :current_player
end
