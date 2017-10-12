source = "\n\ndef hello\n\  puts \"hello\"\nend\n\nputs \"Source code for \#{__FILE__}\"\nputs \"\"\nputs source =  + source.inspect + source"

def hello
  puts "hello"
end

puts "Source code for #{__FILE__}"
puts ""
puts "source = " + source.inspect + source
