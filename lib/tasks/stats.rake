desc "Prints information about LOC"
task :stats do
  puts "Ruby LOC"
  puts %x(find . -name '*.rb' | xargs wc -l)
  puts "Asset LOC"
  puts %x(find . -name '*.coffee' -o -name '*.hamlc' | xargs wc -l)
end