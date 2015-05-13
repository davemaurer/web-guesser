require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  response = check_guess(guess)
  color = background(response)
  erb :index, :locals => {:number => NUMBER, :response => response, :color => color}
end

def check_guess(guess)
  if guess < 0 || guess > 100
    "Stay inbounds!!"
  elsif guess == NUMBER
    "Awesome! You got it right!!"
  elsif guess > NUMBER
    guess > NUMBER + 5 ? "Way too high!" : "Too high!!"
  elsif guess < NUMBER
    guess < NUMBER - 5 ? "Way too low!" : "Too low!!"
  end
end

def background(response)
  if response == "Stay inbounds!!"
    'violet'
  elsif response == "Way too low!" || response == "Way too high!"
    'red'
  elsif response == "Too low!!" || response == "Too high!!"
    'orange'
  elsif response == "Awesome! You got it right!!"
    'green'
  end
end
