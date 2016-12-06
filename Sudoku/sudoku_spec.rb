require_relative 'sudoku'

describe "Sudoku" do
  context "solved?" do
    it "Returns true if the puzzle is solved" do
      board = "812379654594126378673584219431895762925467183786231945159643827267958431348712596"
      expect(solved?(board)).to be true
    end
  end
end
