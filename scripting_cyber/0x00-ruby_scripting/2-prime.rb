#!/usr/bin/env ruby

class Prime
  def self.is_prime?(number)
    return false if number < 2

    for i in 2..Math.sqrt(number).to_i
      if number % i == 0
        return false
      end
    end
    return true
  end
end

def prime(number)
  Prime.is_prime?(number)
end

