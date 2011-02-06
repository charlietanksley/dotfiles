bundle_dir = '/.vim/bundle'

desc "Update all git submodules"
task :update do
  # The idea is easy enough: 
  # make an array of submodule directories,
  # run through that doing git pull origin or whatever,
  # the do a big git commit

  # Current directory
  home = Dir.pwd
  # Directory housing submodules
  submodules = home + bundle_dir

  # Go to right directory
  Dir.chdir submodules

  # Get the list of directories
  submodules = Dir.glob('*')
  submodules.map! { |dir| dir if File.directory? dir }
  submodules.compact!

  # Make sure you only worry about submodules that are their own
  # submodules
  submodules.map! { |dir| dir if File.exists?(dir + '/.git') }
  submodules.compact!

  # Now go into each submodule and perform my git operations.
  submodules.each do |mod|
    Dir.chdir mod
    begin
      %x{git pull origin master}
    rescue
      puts "There was an error in #{mod}"
    end
    Dir.chdir('..')
  end
  Dir.chdir home

  # Figure out which of my submodules have been updated
  changed = %x{git status -s}
  changed = changed.split
  changed.map! { |entry| entry unless entry =~ /^M$/ }
  changed.compact!

  updated = changed.map { |entry| entry if submodules.include? entry }
  updated.compact!

  # Add those that have been updated
  updated.each do |update|
    system "git add #{update}"
  end

  # Now tell me to perform a commit
  puts "The following submodules have been updated:"
  puts
  updated.each do |update|
    puts update
  end
  puts
  puts
  puts "You may need to perform a commit."

end

desc "Tell me about branches"
task :remotes do

  # Current directory
  home = Dir.pwd
  # Directory housing submodules
  submodules = home + bundle_dir

  # Go to right directory
  Dir.chdir submodules

  # Get the list of directories
  submodules = Dir.glob('*')
  submodules.map! { |dir| dir if File.directory? dir }
  submodules.compact!

  # Make sure you only worry about submodules that are their own
  # submodules
  submodules.map! { |dir| dir if File.exists?(dir + '/.git') }
  submodules.compact!

  # Now go into each submodule and perform my git operations.
  submodules.each do |mod|
    Dir.chdir mod
    begin
      puts
      puts mod
      f = %x{git branch -a}
      puts f
      puts
    rescue
      puts "There was an error in #{mod}"
    end
    Dir.chdir('..')
  end
  Dir.chdir home

end
