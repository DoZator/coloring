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

  protected :set_param

  # Output method

  def coloring ( params )

    if params.instance_of?(Array)
      all_params = params.map! { |elem| elem = self.set_param(elem).to_s }.join ";"
    else
      all_params = self.set_param( params )
    end

    "\033[#{all_params}m" + self + "\033[0m"

  end

  # Class method

  class << self  
  
    def view_avaliable
      SGRPARAMS.each { |key, value| puts "#{key}".coloring(value) + " > String.#{key}" }
    end
  
  end

end

String.send(:include, Coloring)

