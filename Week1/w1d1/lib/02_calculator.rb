def add(x,y)
  x + y
end

def subtract(x,y)
  x - y
end

def sum(nums)
  sum = 0
  nums.each { |num| sum += num }
  sum
end

def multiply(nums)
  product = 1
  nums.each { |num| product *= num }
  product
end

def power(x,y)
  x**y
end

def factorial(x)
  return 1 if x == 0 || x == 1
  x * factorial(x-1)
end
