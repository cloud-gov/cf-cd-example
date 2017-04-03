require 'sinatra'

START_TIME = Time.now.strftime("%d/%m/%Y %H:%M:%S %:z")

get '/' do
  "Hello World from Sinatra! Running since #{START_TIME}."
end
