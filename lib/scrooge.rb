module Scrooge
  VERSION = "0.1"

  class Money
    include Comparable

    def initialize(cents)
      @cents = cents.to_i
    end

    def to_i
      to_f.to_i
    end

    def to_f
      to_cents / 100.0
    end

    def to_money
      self
    end

    def to_cents
      @cents
    end

    def <=>(other)
      to_cents <=> other.to_money.to_cents
    end

    def +@
      self
    end

    def -@
      Money.new(-to_cents)
    end

    def +(other)
      Money.new(to_cents + other.to_money.to_cents)
    end

    def -(other)
      self + -other
    end

    def *(other)
      Money.new(to_cents * other)
    end

    def /(other)
      Money.new(to_cents / other)
    end

    def coerce(other)
      [other.to_money, self]
    end

    def method_missing(method, *args, &block)
      to_f.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      to_f.respond_to?(method, include_private)
    end

    def to_s
      to_f.to_s
    end
  end
end

class Numeric
  def to_money
    Scrooge::Money.new(100 * self)
  end

  def as_cents
    Scrooge::Money.new(self)
  end
end

class String
  def to_money
    to_f.to_money
  end

  def as_cents
    to_i.as_cents
  end
end
