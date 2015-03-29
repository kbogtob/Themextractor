$LOAD_PATH << './lib'
require 'textrazor'
require 'pp'

api_key = "<API_KEY>"
text = 'Nicolas Sarkozy, Francois Hollande et Jacques Chirac se sont rencontres a Paris.'

pp TextRazor::parse_entities(api_key, text)
