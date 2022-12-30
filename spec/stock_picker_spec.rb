require_relative '../lib/stock_picker'

describe 'Stock Picker' do
  describe 'stock_picker' do
    it 'picks the correct indexes when there are no edge cases' do
      expect(stock_picker([14, 3, 6, 9, 15, 8, 6])).to eq([1, 4])
    end

    it 'picks the correct indexes when the max value is last' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10, 2, 500])).to eq([7, 10])
    end

    it 'returns nil if no profit can be made' do
      expect(stock_picker([11, 9, 6, 4, 1, 0])).to eq(nil)
    end

    it 'handles edge cases' do
      expect(stock_picker([45, 24, 35, 31, 40, 38, 11])).to eq([1, 4])
    end

    it 'handles small variances' do
      expect(stock_picker([10, 11, 9, 10, 11])).to eq([2, 4])
    end
  end
end
