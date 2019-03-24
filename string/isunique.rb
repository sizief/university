require 'benchmark'

def is_unique_hash? s
  h = Hash.new
  s.chars.each { |char|
    h[char] = h[char].nil? ? 1 : 2
    return false if h[char]==2
  } 
  return true
end

def is_unique_loop? s
  s.chars.each_with_index do |char,index|
    s.chars.each_with_index do |z,zindex|
      next if index == zindex
      return false if char == z
    end
  end
return true
end

def is_unique_string? s
  ('a'..'x').each do |char|
    c =0
    s.chars.each do |z|
      c+=1 if z == char
      return false if c > 1
    end
  return true
  end
end


def is_unique_array? s
  arr = Array.new(256)
  s.chars.each do |z|
    return false if arr[z.ord] == true
    arr[z.ord] == true
  end
  return true
end

x = (0...1000).map { (65 + rand(26)).chr }.join

puts Benchmark.measure {
  is_unique_hash? x
}

puts Benchmark.measure {
  is_unique_loop? x
}

puts Benchmark.measure {
  is_unique_string? x
}


puts Benchmark.measure {
  is_unique_array? x
}
