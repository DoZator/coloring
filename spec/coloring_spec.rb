require File.dirname(__FILE__) + "/../lib/coloring.rb"

describe Coloring do

  before :all do
    @sample = "Hello, World!"
  end
 
  describe "all base methods" do

    it { @sample.red.should be_an_instance_of(String) }

    it "should return right content" do
      @sample.red.should eq("\e[31mHello, World!\e[0m")
    end

    it "consistently call methods must return right content" do
      @sample.red.underline.should eq("\e[4m\e[31mHello, World!\e[0m\e[0m")
    end

  end

  describe "method with params" do

    it "should raise error if no arguments" do
      expect { @sample.coloring }.to raise_error
    end

    it "should raise error if wrong parameter for method" do
      expect { @sample.coloring(:red, :on_blue) }.to raise_error
    end

    it { @sample.coloring(:green).should be_an_instance_of(String) }


    it "should return right content (input params: Symbol)" do
      @sample.coloring(:green).should eq("\e[32mHello, World!\e[0m")
    end

    it "should return right content (input params: String)" do
      @sample.coloring("green").should eq("\e[32mHello, World!\e[0m")
    end

    it "should return right content (input params: Hash)" do
      @sample.coloring(:color => :green).should eq("\e[38;5;2mHello, World!\e[0m")
    end

    it "should return right content (input params > 1: Hash)" do
      @sample.coloring(:color => :green, :background => :red).should eq("\e[48;5;1;38;5;2mHello, World!\e[0m")
    end

  end

end

