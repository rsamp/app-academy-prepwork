def measure(num = 1)
  start_time = Time.now
  num.times { yield }
  return (Time.now - start_time) / num
end
