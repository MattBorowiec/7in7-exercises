
randomNum = rand(10)
correctGuess = false

puts "Guess the number I'm thinking of. OR ELSE"

until correctGuess == true do 
  puts "Enter Guess: "
  guess = gets
  
  puts 'Too high.' if guess.to_i > randomNum
  puts 'Too low.' if guess.to_i < randomNum
  correctGuess = true if guess.to_i == randomNum
end

puts "YOU WIN. HOW TRAGIC."
