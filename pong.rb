#!/usr/bin/env ruby

require 'gosu'
require_relative 'player'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Pong"
    @player1 = Player.new(self)
  end
  
  def update
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player1.up
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpButton1 then
      @player1.down
    end


  end

  def draw
  	@player1.draw
  end
end

window = GameWindow.new
window.show