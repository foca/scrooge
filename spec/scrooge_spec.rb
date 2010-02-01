require "scrooge"
require "spec"

include Scrooge

describe Money do
  subject { Money.new(175) }

  it "can be interpreted as an integer" do
    subject.to_i.should == 1
  end

  it "can be interpreted as a float" do
    subject.to_f.should == 1.75
    subject.to_f.class.should == Float
  end

  it "can be zero" do
    subject.should_not be_zero
    Money.new(0).should be_zero
  end

  describe "doing arithmetic operations" do
    it "can add another number" do
      (subject + 2.00).should == 3.75
    end

    it "can be added to another number" do
      (2.00 + subject).should == 3.75
    end

    it "can be substracted from a number" do
      (2.00 - subject).should == 0.25
    end

    it "can substract a number" do
      (subject - 1.00).should == 0.75
    end

    it "can be multiplied by a number" do
      (subject * 2.0).should == 3.50
    end

    it "can be divided by a number" do
      (subject / 2.0).should == 0.875
    end
  end

  describe "converting to string" do
    it "truncates 2 characters after the decimal point" do
      (0.975).to_money.to_s.should == "0.97"
    end

    it "expands to two decimal places when there're less" do
      0.to_money.to_s.should == "0.00"
    end
  end

  describe "extending core classes" do
    it "allows to convert integers to money objects" do
      2.to_money.should == Money.new(200)
    end

    it "allows converting floats to money objects" do
      2.5.to_money.should == Money.new(250)
    end

    it "allows interpreting numbers as amount of cents" do
      (1500.as_cents).should == 15
    end

    it "can interpet a string as a money value" do
      "123.5".to_money.should == Money.new(12350)
    end

    it "can interpet a string as a number of cents" do
      "12345".as_cents.should == Money.new(12345)
    end
  end

  describe "parsing money strings" do
    it "parses decimal points correctly" do
      Money.parse("15.5").should == 15.5
    end

    it "ignores dollar signs" do
      Money.parse("$10").should == 10
    end

    it "ignores commas" do
      Money.parse("10,000.00").should == 10_000
    end
  end
end
