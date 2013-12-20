#!/usr/bin/env ruby

require 'gosu'
require_relative 'player'
require_relative 'ball'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Pong"
    @player1 = Player.new(self, 0)
    @player2 = Player.new(self, 600, bot = true)

    @ball = Ball.new(self, 100)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end
  
  def update
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player1.up
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpButton1 then
      @player1.down
    end

    if collision?(@player1, @ball)
      @ball.bounce_x
    end

    if collision?(@player2, @ball)
      @ball.bounce_x
    end
    
    @ball.move
    
    #IA 
    if @player2.center_y >= @ball.y
      @player2.up
    end

    if @player2.center_y < @ball.y
      @player2.down
    end

    # Offscreen
    if @ball.get_x < 0
      @ball.restart
      @player2.set_score(@player2.get_score + 1)
    elsif @ball.get_x > 640
      @ball.restart
      @player1.set_score(@player1.get_score + 1)
    end

  end

  def draw
  	@player1.draw
    @player2.draw
  	@ball.draw
    @font.draw("Score: #{@player1.get_score}", 10, 10, 2, 1.0, 1.0, 0xffffff00)
    @font.draw("Score: #{@player2.get_score}", 500, 10, 2, 1.0, 1.0, 0xffffff00)
  end

  def collision?(object_1, object_2)
    hitbox_1, hitbox_2 = object_1.hitbox, object_2.hitbox
    common_x = hitbox_1[:x] & hitbox_2[:x]
    common_y = hitbox_1[:y] & hitbox_2[:y]
    common_x.size > 0 && common_y.size > 0 
  end


end

window = GameWindow.new
window.show