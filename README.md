## About

Extension for Ruby string class. Extension add methods for coloring text or background in Terminal. Also add some text effects. Support 256 colors.

### Features

* String.color ( color: black, red, green, yelow, blue, magenta, cyan, white )
* String.on\_color( background colors same )
* String.bright
* String.underline
* String.blink
* String.negative
* String.hide

Also avaliable class CLI to view all methods and colors.

    $ coloring

### Installation

Add this line to your application's Gemfile:

    gem 'coloring'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coloring

### Usage

Add line:

	require 'coloring'

For base methods:

	puts "Hello, World!".green
	puts "Hello, World!".underline

For call coloring method:	
			
	puts "Hello, World!".coloring(:green)
	puts "Hello, World!".coloring("green")
	
For more params:

	puts "Hello, World!".green.underline
	puts "Hello, World".green.on_red.underline
	puts "Hello, World!".coloring [:green, :on_red, :underline]
	puts "Hello, World!".coloring ["green", "on_red", "underline"]
	puts "Hello, World!".coloring(:green).on_red
	puts "Hello, World!".coloring([:green, :underline]).on_red

For 256 colors ( use CLI to show avaliable colors ):

	puts "Hello, World!".coloring(:color => :green, :background = > :yellow)
	puts "Hello, World!".coloring(:color => "green", :background => "yellow")
	puts "Hello, World!".coloring(color: "green", background: "yellow")
	puts "Hello, World!".coloring(color: 211, background: 35)  
	puts "Hello, World!".coloring(color: 211).on_green
	 
### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Author
	
DoZator, 2012

Sorry for my English )
