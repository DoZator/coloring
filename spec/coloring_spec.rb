require File.dirname(__FILE__) + "/../lib/coloring.rb"

describe Coloring do

  before :all do
    @sample = "Hello, World!"
  end
 
  describe "base colors methods" do

    it "should return value" do
      @sample.green.should_not be_nil 
    end

    it "should return right class" do
      @sample.red.class.should == String
    end

  end

  describe "method with params" do

    it "should return value" do
      @sample.paint(:green).should_not be_nil  
    end

    it "should raise error if no color" do
      expect { @sample.paint(:wrong_color) }.to raise_error
    end

  end

end

