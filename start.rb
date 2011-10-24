#!/usr/bin/env ruby

# Use this file directly like `ruby start.rb` if you don't want to use the
# `ramaze start` command.
#
# All application related things should go into `app.rb`, this file is simply
# for options related to running the application locally.
#
# You can run this file as following:
#
#  $ ruby start.rb
#  $ ./start.rb
#
# If you want to be able to do the latter you'll have to make sure the file can be
# executed:
#
#  $ chmod +x ./start.rb
require 'rubygems'
require 'ramaze'

class MainController < Ramaze::Controller
	def index
		'Hello, world'
	end
end

port = `ps ux | grep #{$$}`.match(/\-p (\d+)/)[1]
Ramaze.start :adapter => :thin, :port => port
