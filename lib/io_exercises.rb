# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  number = (1..100).to_a.sample
  total_guesses = 0
  guess = nil
  until guess == number
    guess = guess_number
    miss(guess, number)
    total_guesses += 1
    puts "Number of guesses #{total_guesses}"
  end
  puts "__________________________________________________________________________"
  puts "The correct number was #{number}"
  puts "It took you #{total_guesses} guesses in total to get to the right number"
  puts "__________________________________________________________________________"
end

def guess_number
  puts "Please guess a number from 1 to 100"
  guess = gets.chomp
  puts "You guessed #{guess}"
  guess.to_i

end

def miss(guess, num)
  if guess < num
    puts "You geussed too low"
  else
    puts "You guessed too high"
  end
end



def shuffle_files
  puts "Please enther the name of the file you would like to have shuffled:"
  file_name = gets.chomp
  file_content = File.readlines(file_name)
  file_content.shuffle!
  shuffled_content = File.open("#{file_name}-shuffled", "w")
  file_content.each do |line|
    shuffled_content.puts line
  end
  shuffled_content.close
  puts "File shuffled and saved as #{file_name}-shuffled"
end


if $0 == __FILE__
  shuffle_files
end

# if $0 == __FILE__
#   guessing_game
# end
