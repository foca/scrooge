require "scrooge"

module Scrooge
  module ActiveRecord
    def attr_cents(*names)
      names.each do |name|
        composed_of name, :class_name  => "Scrooge::Money",
                          :mapping     => ["#{name}_in_cents", "to_cents"],
                          :converter   => lambda {|value| Money.parse(value || 0) },
                          :constructor => lambda {|value| value.to_f.as_cents }
      end
    end
  end
end
