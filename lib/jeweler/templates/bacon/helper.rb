require 'rubygems'
require 'bacon'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require '<%= file_name_prefix %>'

# get a summary of errors raised and such
Bacon.summary_on_exit
