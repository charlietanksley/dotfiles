location = ARGV[0]

def change_directories(arg)
  f = Dir.pwd
  # This is on the right track, but it doesn't deal with multiple
  # ../..s.  You will probably need to use the Pathname library!
  if arg =~ /^\.\./
    f = f.gsub(/\/\w+$/, '')
    arg = arg.gsub(/\.\.\//, '')
  end
  new = f + '/' + arg
  array = File.new(File.expand_path('~/.d_history'), 'r').readlines
  tmp_array = [new]
  array = tmp_array.concat array
  file = File.new(File.expand_path('~/.d_history'), 'w+')
  file.puts array
end

change_directories location

