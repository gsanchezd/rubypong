class Player
	def initialize(window)
		@y = 0.0
		@vel_y = 10.0
		@score = 0
		@image = Gosu::Image.new(window, "pal.jpg", true)
	end

	def up
		@y -= @vel_y
		@y = 0 if @y <= 0
	end

	def down
		@y += @vel_y
	end

	def draw
		@image.draw(0, @y, 0)
	end
end