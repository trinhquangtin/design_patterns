class Shape
  def calculate_area
    raise NotImplementedError
  end
end

class Rectangle < Shape
  attr_accessor :height, :width
  
  def calculate_area
    height * width
  end
end

class Square < Shape
  attr_accessor :side_length
  
  def calculate_area
    side_length * side_length
  end
end
