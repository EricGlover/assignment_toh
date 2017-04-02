#Towers of Hanoi
#Eric Glover
#TM T-Swift
#4/1/17

#Goal:
#build an interactive towers of Hanoi command line game

#Features:
#check for valid input
#print out the currrent board
  #how do?    print vertically or horizontally?
  # #
  ####  #####
  # 1     2     3

  #A
  #B  2 1
  #C  3

  #Disks      :
  # =>            22
  # =>            333         1
  #Positions  :   1     2     3     #Positions  :   A     B     C
#allow the user to quit
#implement a hint function (make sure it's terribly unhelpful, for instance : hint -> you made a mistake a few moves ago)

#start screen
#user input
#consider adding a Rando-Kalrizian feature, where you attempt to solve the puzzle faster than Rando-Kalrizian can (with rando just making random moves obviously)

class TowersOfHanoi
  #create n positions and throw them into an array
  #the number of positions  == the number of disks, all disks start stacked in the first position
  def initialize number_of_positions
    @number_of_positions = number_of_positions
    @number_of_disks = number_of_positions      #redundant but for clarity
    @positions = []
    #initialize positions
    @number_of_positions.times do |i|
      new_position = Array.new(number_of_positions, 0)
      @positions << new_position
    end
    #self.print_towers
    #add the disks to the first position
    @number_of_disks.times do |i|
      @positions[0][i] = i + 1
    end
  end

  def print_towers
    @number_of_positions.times do |i|
      print "tower #{i}: "
      puts @positions[i]
    end
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
    puts "Ok, I know how you wizard types are- very busy and whatnot - so just start telling me where to move the disks and we'll get right on it!"
    #print current setup
    
  end

  #..
end
b = TowersOfHanoi.new 3
b.print_towers
b.positions[0][0] = 1
b.print_towers
