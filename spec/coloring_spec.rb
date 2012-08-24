require File.dirname(__FILE__) + "/../lib/coloring.rb"

describe Coloring do

  before :all do
    @sample = "Hello, World!"
  end
 
  describe "all base methods" do

    it "should return value" do
      @sample.green.should_not be_nil 
    end

    it "should return right class" do
      @sample.red.class.should == String
    end

    it "should return right content" do
      @sample.red.should eq("\e[31mHello, World!\e[0m")
    end

    it "consistently call methods must return right content" do
      @sample.red.underline.should eq("\e[4m\e[31mHello, World!\e[0m\e[0m")
    end

  end

  describe "method with params" do

    it "should return value" do
      @sample.coloring(:green).should_not be_nil  
    end

    it "should return right class" do
      @sample.coloring(:green).class.should == String
    end

    it "should raise error if wrong parameter for method" do
      expect { @sample.coloring(:red, :on_blue) }.to raise_error
    end

    it "should return right content" do
      @sample.coloring(:green).should eq("\e[32mHello, World!\e[0m")
    end

  end

end

