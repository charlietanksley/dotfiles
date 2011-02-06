location = ARGV[0]

def remove_duplicates!(array)
  array.each do |x,y|
    i = array.index(x)
    j = i + 1
    if x == array[j]
      array.delete_at(i)
    end
  end
  array
end

def clean_array(array)
  remove_duplicates! array
  array = array[0..7]
end

def change_directories(arg)
  begin
    Dir.chdir File.expand_path(arg) 
  rescue
    puts 'Sorry, there is no such directory'
  end
  new = Dir.pwd
  
  array = File.new(File.expand_path('~/.d_history'), 'r').readlines
  tmp_array = [new]
  array = tmp_array.concat array
  clean_array array
  file = File.new(File.expand_path('~/.d_history'), 'w+')
  file.puts array

  system "cd #{new}"
end

change_directories location

