require 'rspec'
require 'tdd_projects'


describe "Array" do

  
  describe "#my_uniq" do 
    let(:array) { [1,4,5,1,4,3,7] }
    let(:uniq_array) { array.my_uniq }
    let(:solved) { [1,4,5,3,7]}


    it "should accept an array" do 
      expect { array.my_uniq }.to_not raise_error
    end

    it "should return a new array with unique elements in the order they appeared" do
      expect(array.my_uniq).to eq(solved)
    end

    it "should not modify the original array" do
      expect { array.my_uniq }.to_not change{array}
    end
  end

  describe "#two_sum" do
    let(:array) { [-1, 0, 2, -2, 1] }
    let(:solution) { [[0, 4], [2, 3]] }

    it 'should return an array of pairs of indices' do
      expect(array.two_sum.all? { |pair| pair.length == 2} ).to eq(true)
    end

    it 'should return the expected solution' do
      expect(array.two_sum).to eq(solution)
    end

    it 'should not be confused by one zero' do
      expect([-1,0,4].two_sum).to eq([])
    end

    it 'should properly handle having more than one zero' do
      expect( [-1, 0, 1, 2, 0, -2, 1].two_sum).to eq( [[0, 2], [0, 6], [1, 4], [3, 5]] )
    end
  end

  describe '#my_transpose' do
    let(:matrix) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}

    let(:transposed) {[
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]}

    it 'transposes a matrix' do
      expect(matrix.my_transpose).to eq(transposed)
    end


  end
end
