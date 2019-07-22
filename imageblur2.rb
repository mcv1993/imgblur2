class Image
  def initialize(input)
    @pixels = input
    @pixelsclone = Marshal.load( Marshal.dump(@pixels) )
  end

  def blur
    @pixels.each_with_index do |array, index_y|

      array.each_with_index do |number, index_x|

        if number == 1
          @pixelsclone[index_y][index_x + 1] = 1 if index_x != @pixels[index_y].length - 1
          @pixelsclone[index_y][index_x - 1] = 1 if index_x != 0
          @pixelsclone[index_y + 1][index_x] = 1 if index_y != @pixels.length - 1
          @pixelsclone[index_y - 1][index_x] = 1 if index_y != 0
        end
      end
    end
  end


  def output_image
    @pixelsclone.each do |x|
      x.each do |y|
        print y
        print " "
      end
      puts "\n"
      puts "\n"
    end
  end
end

image = Image.new([
  [0,0,1,0],
  [0,0,0,0],
  [0,0,0,1],
  [0,0,0,0],
  [1,0,0,0],
  [0,0,0,0],
])

image.blur
image.output_image