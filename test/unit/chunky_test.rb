require File.dirname(__FILE__) + '/../test_helper'

class ChunkyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_ChunkyOpenImage
  	image = ChunkyPNG::Image.from_file('in.png')
  	assert image != nil
  end
  
  def test_ChunkySetAndReadPixel
  	image = ChunkyPNG::Image.from_file('in.png')
  	myColor = ChunkyPNG::Color.rgb(50,50,70)
  	image.set_pixel(0,0, ChunkyPNG::Color.parse(myColor))
  	readColor = image.get_pixel(0,0)
  	assert myColor == readColor
  end
end