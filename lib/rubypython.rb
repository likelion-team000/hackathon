RubyPython.start
cPickle = RubyPython.import "cPickle"
puts cPickle.dumps("RubyPython is meh").rubify
RubyPython.stop
