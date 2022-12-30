def stock_picker(days)
  length = days.length
  max_profit = 0

  buy_index = 0
  sell_index = nil

  # Handle edge cases where:
  # lowest day is the last day or
  # highest day is the first day
  check_edge_case = true
  shifted = 0 # track number or elements shifted from the array
  while check_edge_case == true && days.length > 0
    check_edge_case = false
    min, max = days.minmax

    if min == days.last
      days.pop
      check_edge_case = true
    end

    next unless max == days.first

    days.shift
    shifted += 1
    check_edge_case = true
  end

  days.each_with_index do |_, i|
    tmp_days = days.slice(i, length)
    min, max = tmp_days.minmax
    # Get the original index of the min/max by adding
    # the count of sliced and/or shifted elements
    min_index = tmp_days.index(min) + i + shifted
    max_index = tmp_days.index(max) + i + shifted
    next unless min_index < max_index

    profit = max - min
    next unless profit > max_profit

    max_profit = profit
    buy_index = min_index
    sell_index = max_index
  end

  return nil if sell_index.nil?

  [buy_index, sell_index]
end

# Test cases
# p stock_picker([14, 3, 6, 9, 15, 8, 6]) # [1, 4]
# p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10, 2, 500]) # [7, 10]
# p stock_picker([11, 9, 6, 4, 1, 0]) # nil
# p stock_picker([45, 24, 35, 31, 40, 38, 11]) # [1, 4]
# p stock_picker([10, 11, 9, 10, 11]) # [2, 4]
