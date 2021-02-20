# frozen_string_literal: true

# holds it's state in class instance var, stores player instances
class Game
  def self.create(player1, player2)
    @instance = Game.new(player1, player2)
  end

  class << self
    attr_reader :instance
  end

  attr_reader :player1, :player2, :other_player, :current_player

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @current_player = player1
    @other_player   = player2
  end

  def attack(player)
    player.take_damage
  end

  def switch_turns
    self.current_player, self.other_player = other_player, current_player
  end

  def turn_message
    "#{@current_player.name}'s turn"
  end

  def game_over?
    [player1, player2].any?(&:dead?)
  end

  def losing_message
    loser = [player1, player2].select(&:dead?).pop
    "#{loser.name} lost!"
  end

  private

  attr_writer :other_player, :current_player
end
