require 'pry'
require 'minitest'

class Statistician
  def sum numbers
    sum_of_numbers = 0
    numbers.each do |n|
      sum_of_numbers += n
    end
    sum_of_numbers
  end

  def mean numbers
    #sum_of_numbers = 0
    #numbers.each do |n|
      #sum_of_numbers += n
    #end 
   sum(numbers).to_f / numbers.count
  end

  def simple_median numbers
    position = numbers.count / 2
    sorted_numbers = numbers.sorted_numbers
    sorted_numbers[position]
  end

  def mode numbers
    winner = numbers.first
    winning_score = 0
    numbers.each do |n|
      score = numbers.count(n)
      if score > winning_score
        winner = n
        winning_score = score
      end
    end

end

class StaticisticianTest < MiniTest::Test 
  def test_mean_of_three_numbers
    s = Statistician.new
    assert_equal s.mean ([5,10,15]), 10
  end

  def test_mean_of_two_numbers
    s = Statistician.new
    assert_equal s.mean([5,10]), 7.5
  end

  def test_median_sorted
    s = Statistician.new
    assert_equal s.median ([1,2,3,4,5]), 3
  end

  def test_median_unsorted
    s = Statistician.new
    assert_equal s.simple_median ([3,2,5,1,4,1,10,100]), 4
  end

  def test_median_even
    s = Statistician.new
    assert_equal 52, s.simple_median ([1,50,100,52]), 50
  end

  def test_mode_lots
    s = Statistician.new
    assert_equal 1, s.mode ([1,2,5,7,9,1,1])
  end

  def test_mode_little
    s = Statistician.new
    assert_equal s.mode ([4,2,3,2,3]) == 2 || s.mode ([4,2,3,2,3]) == 3
  end
end


#number = [1,2,5,7,9,1,1]

#s = Statistician.new

#binding.pry

#puts "Mean: #{s.mean numbers}"
#puts "Median: #{s.median numbers}"
#puts "Mode: #{s.mode numbers}"