# frozen_string_literal: true

# embodies users of the game
class Player
  attr_reader :name, :hit_points

  DEFAULT_HIT_POINTS = 100

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name       = name
    @hit_points = hit_points
  end

  def take_damage
    self.hit_points -= rand(5..20)
  end

  def dead?
    hit_points <= 0
  end

  private

  attr_writer :hit_points
end
