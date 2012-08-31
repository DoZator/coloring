require "coloring/version"

module Coloring

  # Select Graphic Rendition parameters
  
  SGRPARAMS = {
    :bright     => 1,
    :underline  => 4,
    :blink      => 5,
    :negative   => 7,
    :hide       => 8,
    :black      => 30,
    :red        => 31, 
    :green      => 32, 
    :yellow     => 33, 
    :blue       => 34, 
    :magenta    => 35, 
    :cyan       => 36, 
    :white      => 37,
    :on_black   => 40,
    :on_red     => 41,
    :on_green   => 42,
    :on_yellow  => 43,
    :on_blue    => 44,
    :on_magenta => 45,
    :on_cyan    => 46,
    :on_white   => 47
  }

  # Define base methods

  SGRPARAMS.each do |effect, value|
    define_method( effect ) { self.coloring( value ) }
  end

  protected

  # Set effect value from SGR Hash

  def set_param ( param )

    if param.instance_of?(Fixnum)
      param
    elsif param.instance_of?(String)
      param = SGRPARAMS[param.to_sym]
    else
      param = SGRPARAMS[param]
    end
    param

  end

  # Set support Hash input (support 256 colors)

  def input_options ( params )

    set = lambda { |e| e = e.instance_of?(Fixnum) ? e : self.set_param(e)-30 } 

    options = []

    if params.has_key?(:background)
      background = set.call(params[:background])
      options << 48 << 5 << background
    end
    if params.has_key?(:color)
      color = set.call(params[:color])
      options << 38 << 5 << color
    end

    options

  end

  public

  # Output method

  def coloring ( params )

    params = self.input_options( params ) if params.instance_of?(Hash)

    if params.instance_of?(Array)
      all_params = params.map! { |elem| elem = self.set_param(elem).to_s }.join ";"
    else
      all_params = self.set_param( params )
    end

    "\033[#{all_params}m" + self + "\033[0m"

  end

  # Class method

  class << self

    def gamma

      puts "All base methods:".on_yellow + "\n\n"

      SGRPARAMS.each {|key, value| puts "#{key}".coloring(value) + " method: #{key}"}

      puts "\n"
      puts "System colors for xterm-256color:".on_yellow + "\n\n"

      0.upto(7) do |i|
        print "\033[48;5;#{i}m #{i} \033[000m"
      end

      puts "\n"

      8.upto(15) do |i|
        print "\033[48;5;#{i}m #{i} \033[000m"
      end

      puts "\n\n"

      0.upto(5) do |g|
        0.upto(5) do |r|
          0.upto(5) do |b|
            color = 16 + r*36 + g*6 + b
            print "\033[48;5;#{color}m #{color}"
          end    
          print "\033[0m "
        end    
        print "\n"
      end    

      puts "\n"
      puts "Grayscale ramp:".on_yellow + "\n\n"

      232.upto(255) do |i|
        print "\033[48;5;#{i}m #{i} \033[000m"
      end

      puts "\n"
    end

  end

end

String.send(:include, Coloring)

