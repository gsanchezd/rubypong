require 'pp'
class Player

  def initialize(window, x, bot = false)
    @y = 0.0
    @x = x
    @vel_y = 0.0
    @acl_y = 0.0
    @impulse_y = 1.0
    @friction = 0.2
    @score = 0
    @image = Gosu::Image.new(window, "pal.jpg", true)
    @bot = bot
  end

  def up
    @acl_y = @impulse_y * -1
  end

  def down
    @acl_y = @impulse_y
  end

  def guard_offscreen
    @y = 420 if @y >= 420
    @y = 0 if @y <= 0
  end

  def draw
    @image.draw(@x, @y, 0)
  end

  def move

    @vel_y = @vel_y + @acl_y
    @y += @vel_y

    #friction
    if @acl_y.abs > 0.2
      dir = @acl_y <=> 0.0
      @acl_y = (@acl_y.abs - @friction) * dir
    else
      pp "stop"
      @acl_y = 0
      @vel_y = 0

    end

    guard_offscreen
  end

  def center_y
    @y + (@image.height / 2).to_i
  end

  def bot?
    return @bot
  end

  def get_score
    return @score
  end

  def set_score(score)
    @score = score
  end


  def hitbox
    hitbox_x = ((@x.to_i)..(@x + @image.width.to_i)).to_a
    hitbox_y = ((@y.to_i)..(@y + @image.height.to_i)).to_a
    {:x => hitbox_x, :y => hitbox_y}
  end
end
