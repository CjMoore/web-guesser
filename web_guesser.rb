require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
@color = nil

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER,
                          :message => message,
                          :color => @color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    if guess > SECRET_NUMBER + 5
      @color = "background: red;"
      "Way too high!"
    else
      @color = "background: pink;"
      "Too high!"
    end
  elsif guess < SECRET_NUMBER
    if guess < SECRET_NUMBER - 5
      @color = "background: red;"
      "Way too low!"
    else
      @color = "background: pink;"
      "Too low!"
    end
  else
    @color = "background: green;"
    "You got it right. The secret number is #{SECRET_NUMBER}"
  end
end
