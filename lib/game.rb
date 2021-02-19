class Game
  attr_reader :player_1, :player_2, :other_player, :current_player

  def initialize(player_1, player_2)
    @player_1       = player_1
    @player_2       = player_2
    @current_player = player_1
    @other_player   = player_2
  end

  def attack(player)
    player.take_damage
  end

  def switch_turns
    if current_player == player_1
      self.current_player, self.other_player = player_2, player_1
    else
      self.current_player, self.other_player = player_1, player_2
    end
  end

  def turn_message
    return "#{@current_player.name} lost!" if current_player.dead?
    "#{@current_player.name}'s turn"
  end

  private

  attr_writer :other_player, :current_player
end
