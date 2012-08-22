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
      @sample.coloring(:green).should_not be_nil  
    end

    it "should return right class" do
      @sample.red.class.should == String
    end

    it "should raise error if wrong parameter for method" do
      expect { @sample.coloring(:red, :on_blue) }.to raise_error
    end

  end

end

