# PHASE 2
def convert_to_int(str)
  # valid_input = %w(1 2 3 4 5 6 7 8 9 0)
  # unless valid_input.include?(str)
  #   raise ArgumentError.new "You need a valid number (0-9)"
  # end
  begin
    result = Integer(str)
  rescue ArgumentError => e
    puts "Need a valid number instead of #{str}"
  ensure
    result ||= nil
  end


end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NonFruitError
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp

    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NonFruitError => e
    puts e.message
  end
end

class CoffeeError < StandardError
  def message
    "Thanks for the coffee but I prefer fruit"
  end
end

class NonFruitError < StandardError
  def message
    "That is not a valid fruit (apple, banana, orange)"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    if yrs_known < 5
      raise FriendshipError
    end
    @fav_pastime = fav_pastime
    if fav_pastime.length <= 0 || name.length <= 0
      raise LazyTyperError
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

class FriendshipError < StandardError
  def message
    "I don't know you...Act like you know"
  end
end

class LazyTyperError < StandardError
  def message
    "Type in a real answer you filthy animal"
  end
end
