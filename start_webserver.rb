# coding:utf-8
require 'webrick'
require './servlets'

srv = WEBrick::HTTPServer.new({
    :DocumentRoot => './public',
    :Port => 10081,
    :AccessLog => [[File.open("./logs/log.txt", 'w'), WEBrick::AccessLog::CLF]],
  })

srv.mount('/add', Add)
srv.mount('/show', Show)
trap("INT"){ srv.shutdown }
srv.start 

#test. something changed. 
#In fact, nothing changed.
