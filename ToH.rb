#Towers of Hanoi
#Eric Glover
#TM T-Swift
#4/1/17

#Goal:
#build an interactive towers of Hanoi command line game

#Status : Operational

#Current Features:
#check for valid input
#print out the currrent board
#allow the user to quit
#start screen

#Features yet to be implemented :
#consider adding a Rando-Kalrizian feature, where you attempt to solve the puzzle faster than Rando-Kalrizian can (with rando just making random moves obviously)
#consider adding scrolling text
#add commands like print the current board at anytime, or a print moves (print all your previous moves) or a print number of moves
#add a victory screen
#implement a hint function (make sure it's terribly unhelpful, for instance : hint -> you made a mistake a few moves ago)

#basic Implementation Notes :
#we keep track of the disks as a number, with 3 being bigger than 1, etc..
#the disks are stored in @positions[][]

  #function list
#def initialize (number_of_disks)
#def print_towers
#def welcome_mat
#def check_input (input_from, input_to)
#def check_move (from, to)
#def move (from, to)
#def game_over?
#def play
#def victory 


class TowersOfHanoi

  def initialize number_of_disks

    @number_of_positions = 3
    @number_of_disks = number_of_disks
    @positions = []
    @moves = 0        #a move counter

    #initialize positions
    @number_of_positions.times do |i|
      #new_position = Array.new(number_of_positions)     #if we keep the empty spots set to nil, later it won't print them (as opposed to working around 0)
      new_position = []   #no more nils plz
      @positions << new_position
    end

    #add the disks to the first position
    @number_of_disks.times do |i|
      #@positions[0][i] = i + 1
      @positions[0][i] = @number_of_disks - i
    end
  end

  def print_towers
    @number_of_disks.times do |i|
      @number_of_positions.times do |j|
        #print "#{@positions[j][ -(i+1) ]} "
        print "#{@positions[j][ @number_of_disks - 1 - i]} "
        if @positions[j][ @number_of_disks - 1 - i] == nil
          print " "
        end
      end
      puts ""
    end
    @number_of_positions.times do |i|
      print (97 + i).chr + " "
    end
    puts ""

  end

  #
  def welcome_mat
    print "Have you come to join the celebration!? The Apocalypse is nigh!\n"
    puts "Oh WAIT "
    puts "You're the Wizard! The one who's come to instruct the priests on the completion of our great Tower of Hanoi!"
    print "Simply marvelous..what a stroke of luck we had finding you, I certainly could never figure this thing out, I mean just look at it!\n"
      #if you later want to have the user decide how many disks there are use this
    #puts  "Its, 7, noo...18...no..gee I'm terrible at counting, how many disks are on that tower??"
    #number_of_disks = gets.chomp.to_i
    print "Yeah #{@number_of_disks} is crazy high man.\n"

    print_towers
    puts "As you can see the tower is on the left (position A) and we need to move it all to the right (position C)"
    puts "But we have to move it without ever moving a bigger disk on top of a smaller one."
    puts "Ok, I know how you wizard types are- very busy and whatnot - so just start telling me where to move the disks and we'll get right on it!"
    puts "(Enter 'quit' at any time to stop)"
  end

#check user input, needs to be a reasonable number and you can't move a bigger disk onto a smaller one
  def check_input (input_from, input_to)
    #first we check for "quit", then check that inputs are in correct range
    if (input_from == "quit" || input_to == "quit")
      puts "Quitting"
      exit
    end
    input_to = input_to.to_i
    input_from = input_from.to_i
    if !(1..@number_of_positions).include?(input_to)
      return false
    elsif !(1..@number_of_positions).include?(input_from)
      return false
    else
      return true
    end
  end

#check if the move is legal
  def check_move (from, to)
    if @positions[from - 1].empty?
      return false
    elsif @positions[to - 1].empty?
      return true
    elsif to == from
      return false
    end

    to_disk = @positions[to - 1].last
    from_disk = @positions[from - 1].last
    if from_disk > to_disk
      return false
    else
      return true
    end
  end

  #move a disk from one spot to another
  def move (from, to)
    disk = @positions[from - 1].pop
    @positions[to - 1] << disk
    @moves = @moves + 1
  end

  #the game is over when all the stacks are in position C, sorted biggest to smallest
  def game_over?
    @correct_stack = []
    stack_c = @positions[@number_of_positions - 1]
    @number_of_disks.times do |i|
      if stack_c[i] != @number_of_disks - i
        return false
      end
    end
    return true
  end

  def victory
    puts "Thank you so much! We've finally done it!"
    puts "Look at it in all it's magnificience!"
    print_towers
    puts "And to think it only took #{@moves} moves, you truly are a wizard"    #perhaps add a rating system? ex :  you truly are..n't a wizard....
  end

  def play
    welcome_mat
    until game_over?

      #get user input
      valid_input = false
      until valid_input       #implementation note, opting to have them put numbers on different lines to lessen the load of parsing
        puts "What's the stack position of the disk you want moved?"
        input_from = gets.chomp
        puts "Which stack position should we put it at?"
        input_to = gets.chomp
        valid_input = check_input(input_from, input_to)
        if valid_input
          valid_input = check_move(input_from.to_i, input_to.to_i)
          if !valid_input
            puts "I'm sorry but that's not possible"
          end
        end
      end

      #move disk
      move(input_from.to_i, input_to.to_i)
      #print new tower setup
      print_towers
    end
    #print a victory screen
    victory
  end

end
b = TowersOfHanoi.new 3
#b.print_towers
b.play
