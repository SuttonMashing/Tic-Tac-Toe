require "./game"
require "./rules"



describe "Board" do 
    it "initialises empty 3x3 board" do
        rules = Rules.new
        game = Game.new(rules)
        expect(game.move("", 0)).to eq([[" "," "," "],[" "," "," "],[" "," "," "]]) 
    end

    it "places Cross in centre of board" do
        rules = Rules.new
        game = Game.new(rules)
        expect(game.move("B2", 0)).to eq([[[" "," "," "],[" ", "X", " "],[" "," "," "]], 1]) 
    end

    it "places Cross in bottom left" do
        rules = Rules.new
        game = Game.new(rules)
        expect(game.move("C1", 0)).to eq([[[" "," "," "],[" ", " ", " "],["X"," "," "]], 1]) 
    end

    it "if there is already a cross in B1, print invalid move" do
        rules = Rules.new
        game = Game.new(rules)
        expect(game.move("B1", 0)).to eq([[[" "," "," "],["X"," "," "],[" "," "," "]], 1]) 
        expect{game.move("B1", 0)}.to output("Invalid Move!\n").to_stdout
    end

    it "takes A1, B2, C3" do
        # Arrange
        rules = Rules.new
        game = Game.new(rules)
        game.move("A1", 0)
        game.move("B2", 1)

        # Act and assert
        expect(game.move("C3", 2)).to eq([[["X"," "," "],[" ","O"," "],[" "," ","X"]], 3]) 
    end

    it "If counter = 1, place player 'O'" do
        rules = Rules.new
        game = Game.new(rules, 1)
        expect(game.move("A1", 1)).to eq([[["O"," "," "],[" "," "," "],[" "," "," "]], 2]) 
    end

    it "Test counter increases" do
        rules = Rules.new
        game = Game.new(rules, 8)
        game.move("C1", 2)
        expect(game.counter).to eq(9)
    end

   

    it "will return zero moves when all moves are used up" do
        # Arrange
        
        rules = Rules.new
        game = Game.new(rules)
        # Act
        # (First call move 9 times)
        game.move("A1", 0)
        game.move("A2", 0)
        game.move("A3", 0)
        game.move("B1", 0)
        game.move("B2", 0)
        game.move("B3", 0)
        game.move("C1", 0)
        game.move("C2", 0)
        game.move("C3", 0)
        
        
        result = game.moves_remaining()

        
        # Assert 
        expect(result). to eq(0)
    end

    it "When counter reaches 9 the message 'Game over' is printed" do
        rules = Rules.new
        game = Game.new(rules, 9)
        allow(rules).to receive(:gets).and_return("C1\n")
        expect(game.passes_remaining_moves_to_rules).to eq(true)
    end
    
end

describe "row finder" do
    it "gets row given index" do
        rules = Rules.new
        game = Game.new(rules)
        expect(game.row_finder("C1")).to eq(2) #row is the letter
    end
end

describe "column finder" do
    it "gets column given index" do
        rules = Rules.new
        game = Game.new(rules)
        expect(game.col_finder("B1")).to eq(0) #column is the number
    end
end

describe "board printer" do
    it "prints the current board" do
        rules = Rules.new
        game = Game.new(rules)
        game.move("A2", 0)
        game.move("B1", 1)
        game.move("C3", 2)
        expect(game.print_board()).to eq([[" ","X"," "],["O"," "," "],[" "," ","X"]])
    end
end



# it "While counter < 9 the main function takes an input move" do
    #     # Arrange
    #     game = Game.new(8)
    #     expected_output = a_string_starting_with("Please enter your move: ")
    #     allow(game).to receive(:gets).and_return("C1\n")

    #     # Assert
    #     expect{game.main}.to output(expected_output).to_stdout
    # end


    # it "will return zero moves when all moves are used up" do
    #     # Arrange
    #     game_logic = double("GameLogic")
    #     expect(game_logic).to receive("take_move").and_return(0)
    #     expected_output = "No moves left"
    #     game = Game.new(4)        

    #     # Assert
    #     expect{game.take_input}.to output(expected_output).to_stdout
    # end