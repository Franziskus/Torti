require 'chunky_png'

class PieController < ApplicationController

  def drawLine(x,y,x2,y2,image)
    w = x2 - x
    h = y2 - y
    dx1 = 0
    dy1 = 0
    dx2 = 0
    dy2 = 0
    if (w<0)
      dx1 = -1
    elsif (w>0)
      dx1 = 1
    end
    if (h<0)
       dy1 = -1
    elsif (h>0)
      dy1 = 1
    end
    if (w<0)
       dx2 = -1
    elsif (w>0)
       dx2 = 1
    end
    longest =  w.abs
    shortest = h.abs
    if (!(longest>shortest))
        longest = h.abs
        shortest =w.abs
        if (h<0)
          dy2 = -1
        elsif (h>0)
          dy2 = 1
        end
        dx2 = 0
    end
    numerator = longest >> 1
    for i in 0...longest
      image.set_pixel(x,y, ChunkyPNG::Color.parse(ChunkyPNG::Color.rgb(0,0,0)))
      numerator += shortest ;
      if (!(numerator<longest))
       numerator -= longest
       x += dx1
       y += dy1
      else
        x += dx2
        y += dy2
      end
    end
  end

  def genPie
    if(params[:a] != nil && params[:b] != nil)
      @a = params[:a].to_i
      @b = params[:b].to_i
      @g = @a+@b;
      @w1 = (Math::PI * 2) * @a / @g
      @xEnd = Math.cos(@w1)*50;
      @yEnd = Math.sin(@w1)*50;
      image = ChunkyPNG::Image.from_file('in.png')
      drawLine(50,50,100,50,image)
      drawLine(50,50,@xEnd.round+50,@yEnd.round+50,image)
      image.save('out.png')
      send_file 'out.png', :type => 'image/jpeg', :disposition => 'inline'
    end
  end
end
