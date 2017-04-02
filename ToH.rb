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

#tiemz to hax shit

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

  #..
end
b = TowersOfHanoi.new 3
b.print_towers
b.positions[0][0] = 1
b.print_towers
