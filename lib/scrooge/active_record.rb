require "scrooge"

module Scrooge
  module ActiveRecord
    def attr_cents(*names)
      names.each do |name|
        composed_of name, :class_name  => "Scrooge::Money",
                          :mapping     => ["#{name}_in_cents", "to_cents"],
                          :converter   => lambda {|value| (value || 0).to_money },
                          :constructor => lambda {|value| value.to_f.as_cents }
      end
    end
  end
end
