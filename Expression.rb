class IntegerPrimative
  attr_reader:number
  def initialize(number)
    @number = number
  end
  def evaluate(env)
    self
  end
  def to_s
    "#{@number}"
  end
end

class FloatPrimative
  attr_reader:float
  def initialize(float)
    @float = float
  end
  def evaluate(env)
    self
  end
  def to_s
    "#{@float}"
  end
end

class BooleanPrimative
 attr_reader:boolean
  def initialize(boolean)
    @boolean = boolean
  end
  def evaluate(env)
    self
  end
  def to_s
    "#{@boolean}"
  end
end
class StringPrimative
  attr_reader:string
  def initialize(string)
    @string = string
  end
  def evaluate(env)
    self
  end
  def to_s
    "#{@string}"
  end
end

class Add
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number + right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float + right_val.float)
    else
      raise "Add type mismatch"
    end
  end
end

class Subtract
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number - right_val.number)
    elsif @left.is_a?(FloatPrimative) && @right.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float - right_val.float)
    else
      raise "Subtract type mismatch"
    end
  end
end

class Multiply
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number * right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float * right_val.float)
    else
      raise "Multiply type mismatch"
    end
  end
end

class Divide
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number / right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float / right_val.float)
    else
      raise "Divide type mismatch"
    end
  end
end

class Modulo
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number % right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float % right_val.float)
    else
      raise "Mod type mismatch"
    end
  end
end

class Exponent
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if lef_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(lef_val.number ** right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float ** right_val.float)
    else
      raise "Exponent type mismatch"
    end
  end
end

class And
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(BooleanPrimative) && right_val.is_a?(BooleanPrimative)
      BooleanPrimative.new(left_val.boolean & right_val.boolean)
    else
      raise "And type mismatch"
    end
  end
end

class Or
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if right_val.is_a?(BooleanPrimative) && right_val.is_a?(BooleanPrimative)
      BooleanPrimative.new(left_val.boolean | right_val.boolean)
    else
      raise "Or type mismatch"
    end
  end
end

class Not
  def initialize(value)
    @value = value
  end
  def evaluate(env)
    val = @value.evaluate(env)
    if @value.is_a?(BooleanPrimative)
      BooleanPrimative.new(!val.boolean)
    else
      raise "Not type mismatch"
    end
  end
end

class Lvalues
 def initialize(var)
    @var = var
  end
  
  def evaluate(env)
    env.get_spot(@var)
  end
end

class Rvalues
  def initialize(row, col)
    @row = row
    @col = col
  end

  def row
    @row
  end

  def col
    @col
  end

  def evaluate(env)
    env.get(row, col)
  end
end

class BitAnd
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number & right_val.number)
    elsif @left.is_a?(FloatPrimative) && @right.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float & right_val.float)
    else
      raise "BitAnd type mismatch"
    end
  end
end

class BitOr
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number | right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float | right_val.float)
    else
      raise "BitOr type mismatch"
    end
  end
end

class BitXor
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a(IntegerPrimative) && right_val.is_a(IntegerPrimative)
      IntegerPrimative.new(left_val.number ^ right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float ^ right_val.float)
    else
      raise "BitXor type mismatch"
    end
  end
end

class BitNot
  def initialize(value)
    @value = value
  end
  def evaluate(env)
    val = value.evaluate(env)
    if val.is_a?(IntegerPrimative)
      IntegerPrimative.new(~val.number)
    elsif val.is_a?(FloatPrimative)
      FloatPrimative.new(~val.float)
    else
      raise "BitNot type mismatch"
    end
  end
end

class LeftShift
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number << right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float << right_val.float)
    else
      raise "Left Shift type mismatch"
    end
  end
end

class RightShift
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      IntegerPrimative.new(left_val.number >> right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      FloatPrimative.new(left_val.float >> right_val.float)
    else
      raise "Right Shift type mismatch"
    end
  end
end

class Equal
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      BooleanPrimative.new(left_val.number == right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      BooleanPrimative.new(left_val.float == right_val.float)
    elsif left_val.is_a?(BooleanPrimative) && right_val.is_a?(BooleanPrimative)
      BooleanPrimative.new(left_val.boolean == right_val.boolean)
    else
      raise "Equal type mismatch"
    end
  end
end

class NotEqual
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      BooleanPrimative.new(left_val.number != right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      BooleanPrimative.new(left_val.float != right_val.float)
    elsif left_val.is_a?(BooleanPrimative) && right_val.is_a?(BooleanPrimative)
      BooleanPrimative.new(left_val.boolean != right_val.boolean)
    else
      raise "Not Equal type mismatch"
    end
  end
end

class LessThan
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      BooleanPrimative.new(left_val.number < right_val.number)
    elsif @left.is_a?(FloatPrimative) && @right.is_a?(FloatPrimative)
      BooleanPrimative.new(@left.evaluate.float < @right.evaluate.float)
    else
      raise "Less Than type mismatch"
    end
  end
end

class GreaterThan
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      BooleanPrimative.new(left_val.number > right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      BooleanPrimative.new(left_val.float > right_val.float)
    else
      raise "Greater than type mismatch"
    end
  end
end

class LessThanEqual
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      BooleanPrimative.new(left_val.number <= right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      BooleanPrimative.new(left_val.float <= right_val.float)
    else
      raise "Less than type mismatch"
    end
  end
end

class GreaterThanEqual
  def initialize(left, right)
    @left = left
    @right = right
  end
  def evaluate(env)
    left_val = @left.evaluate(env)
    right_val = @right.evaluate(env)
    if left_val.is_a?(IntegerPrimative) && right_val.is_a?(IntegerPrimative)
      BooleanPrimative.new(left_val.number >= right_val.number)
    elsif left_val.is_a?(FloatPrimative) && right_val.is_a?(FloatPrimative)
      BooleanPrimative.new(left_val.float >= right_val.float)
    else
      raise "Less than type mismatch"
    end
  end
end

class FloatToInt
  def initialize(value)
    @value = value
  end
  def evaluate(env)
    val = value.evaluate(env)
    if val.is_a?(FloatPrimative)
      IntegerPrimative.new(val.float.to_i)
    else
      raise "Float to Int type mismatch"
    end
  end
end

class IntToFloat
  def initialize(value)
    @value = value
  end
  def evaluate(env)
    val = value.evaluate(env)
    if val.is_a?(IntegerPrimative)
      FloatPrimative.new(val.number.to_f)
    else
      raise "Int to Float type mismatch"
    end
  end
end

class Max
  def initialize(first, last)
    @first = first
    @last = last
  end
  def evaluate(env)
    max = 0
    for i in @first.row..@last.row
      for j in @first.col..@last.col
        if env.get(i,j).evaluate(env).number > max
          max = env.get(i,j).evaluate(env).number
        end
      end
    end
    IntegerPrimative.new(max)
  end
end

class Min
  def initialize(first, last)
    @first = first
    @last = last
  end
  def evaluate(env)
    min = env.get(1,1).evaluate(env).value
    for i in @first.row..@last.row
      for j in @first.col..@last.col
        if env.get(i,j).evaluate(env).number < min
          min = env.get(i,j).evaluate(env).number
        end
      end
    end
    IntegerPrimative.new(min)
  end
end

class Mean
  def initialize(first, last)
    @first = first
    @last = last
  end
  def evaluate(env)
    total = 0
    amount = 0
    for i in @first.row..@last.row
      for j in @first.col..@last.col
        total += env.get(i,j).evaluate(env).number
        amount += 1
      end
    end
    IntegerPrimative.new(total / amount)
  end
end

class Sum
  def initialize(first, last)
    @first = first
    @last = last
  end
  def evaluate(env)
    sum = 0
    for i in @first.row..@last.row
      for j in @first.col..@last.col
        sum += env.get(i,j).evaluate(env).number
      end
    end
    IntegerPrimative.new(sum)
  end
end

class Environment
  attr_reader :grid
  def initialize(grid)
    @grid = grid
    @table = Hash.new
  end
  
  def get(row, col)
    grid.get(row, col).evaluate(self)
  end
  def set_value(key, value)
    @table.store(key, value)
  end
  def get_value(key)
    if @table.has_key?(key)
      @table.fetch(key)
    else
      raise "Key not found"
    end
  end
end

class Grid
  def initialize(table = "")
    @table = Hash.new
    if table != ""
      @table.update(table)
    end
  end
  def table
    @table
  end
  def set_value(key, value)
    table.store(key, value)
  end
  def get_value(key)
    if table.has_key?(key)
      table.fetch(key)
    else
      raise "Key not found"
    end
  end
  def set(x, y, value)
    table.store("#{x},#{y}",value)
  end
  def get(x,y)
    if table.has_key?("#{x},#{y}")
      table.fetch("#{x},#{y}")
    else
      raise "no cell found"
    end
  end
  def has_key(x, y)
    table.has_key?("#{x},#{y}")
  end
end

class Cell
  attr_reader :x, :y
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end





grid = Grid.new()
grid.set(1,1, Add.new(IntegerPrimative.new(1), IntegerPrimative.new(2)))
grid.set(1,2, Subtract.new(IntegerPrimative.new(10), IntegerPrimative.new(5)))
grid.set(1,3, Multiply.new(IntegerPrimative.new(2), IntegerPrimative.new(3)))
grid.set(1,4, Divide.new(IntegerPrimative.new(10), IntegerPrimative.new(2)))
grid.set(2,1, Modulo.new(IntegerPrimative.new(10), IntegerPrimative.new(3)))
grid.set(2,2, Multiply.new(IntegerPrimative.new(2), IntegerPrimative.new(3)))
grid.set(2,3, Add.new(IntegerPrimative.new(2), IntegerPrimative.new(3)))
grid.set(2,4, Subtract.new(IntegerPrimative.new(10), IntegerPrimative.new(5)))
grid.set(3,1, Add.new(Divide.new(IntegerPrimative.new(10), IntegerPrimative.new(2)), IntegerPrimative.new(2)))

env = Environment.new(grid)
puts Sum.new(Rvalues.new(1, 1), Rvalues.new(2, 4)).evaluate(env)
puts Max.new(Rvalues.new(1, 1), Rvalues.new(2, 4)).evaluate(env)
puts Add.new(Rvalues.new(1, 1), Rvalues.new(2, 4)).evaluate(env)
puts Subtract.new(Rvalues.new(3, 1), Rvalues.new(2, 4)).evaluate(env)
