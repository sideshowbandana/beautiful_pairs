require "beautiful_pairs/version"

module BeautifulPairs
  def solve
    puts run(gets.chomp.to_i, gets.chomp.split.map(&:to_i), gets.chomp.split.map(&:to_i))
  end
  module_function :solve

  def run(length, a, b)
    counter = 0
    a_hash = Hash.new(0)
    a.each do |n|
      a_hash[n] += 1
    end
    b.each do |n|
      counter += 1 if (a_hash[n] -= 1) >= 0
    end
    only_in_b = a_hash.find{|k,v| v < 0 }
    only_in_a = a_hash.find{|k,v| v > 0 }
    counter += 1 if only_in_b && only_in_a
    counter -= 1 if !only_in_b && !only_in_a
    counter
  end
  module_function :run
end
