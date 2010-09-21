require 'fileutils'


def extract_vimball ( file )

  # start by making the directory
  #
  @directory = (File.expand_path('~') + '/.dotfiles/.vim/bundle/' + File.basename(file, '.vba')).gsub(/(-.0-9$)/, '')
  FileUtils.mkdir @directory unless File.exists? @directory

  # the new plan is to put all the lines into an array and take it from there
  # Now the main program.
  # First, read each line, looking for matches

  complete_file = file.readlines
  filenames_orig = complete_file.find_all{ |item| item =~ /\[\[\[1/}
  filenames = filenames_orig.map {|x| x.gsub!('[[[1', '').rstrip}
  Dir.chdir(@directory)
  filenames.each do |file|
    sub_directory = (File.dirname(file))
    FileUtils.makedirs sub_directory unless File.exists? sub_directory
  end

 
  # parse the file by line number via a hash
  #
  hash_table = Hash.new
  complete_file.each do |x|
    if filenames_orig.include? x
      length = complete_file[complete_file.index(x) + 1].rstrip.to_i
      start = complete_file.index(x) + 2
      stop = start + length
      @temp_hash = Hash[x.rstrip, [complete_file.index(x), length, start, stop]]
      hash_table.update(@temp_hash)
    else
    end
  end

  # now make and populate the files
  #
  hash_table.each_pair do |key, value|
    File.new(key, 'w+').puts complete_file[value[2]...value[3]]
  end
file.close
end

ARGV.each do |f|
  extract_vimball File.new f 
end
