require 'pp'
class Ball
	def initialize(window, x)
		@y = 0.0
		@x = x
		@vel_y = 2.0
		@vel_x = 3.0
		@image = Gosu::Image.new(window, "ball.jpg", true)
	end

	def restart
		@y = 0.0
		@x = 300
		@vel_y = 2.0
		@vel_x = 3.0
	end

	def move
		@x += @vel_x
		@y += @vel_y
		check_bounce_y
	end


	def bounce_x
		@vel_x *= -1
	end

	def bounce_y
		@vel_y *= -1
	end

	def check_bounce_x
	end

	def check_bounce_y
		bounce_y if @y + @vel_y < 0
		bounce_y if @y + @vel_y > 480
	end


	def draw
		@image.draw(@x, @y, 0)
	end

	def hitbox
  		hitbox_x = ((@x - @image.width/2).to_i..(@x + @image.width/2.to_i)).to_a
  		hitbox_y = ((@y - @image.width/2).to_i..(@y + @image.width/2).to_i).to_a
  		{:x => hitbox_x, :y => hitbox_y}
	end

	def y
		pp @y
		return @y
	end

	def get_x
		return @x
	end


end