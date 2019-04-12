class FileRenamer

  # constructor
  def initialize
    @files = []
    @count = 0
  end

  # Getter
  def ReturnCount
    @count
  end

  # Counts files recursively from the current working directory (cwd)
  def CountFiles
    childrenFiles = []
    cwd = File.dirname(__FILE__) # get parent directory from ou script
    childrenFiles = Dir.glob(cwd + '/**/*').select{ |e| File.file? e }

    childrenFiles.each do |file|
      if File.extname(file).empty?
        @count += 1
        @files.push(file)
      end
    end
  end

  def RenameFiles(extension)
    @files.each do |file|
      File.rename(file, file + '.' + extension)
    end
  end

end


obj = FileRenamer.new
obj.CountFiles
filesToProcess = obj.ReturnCount

if filesToProcess == 0
  puts "Error : No files without extension in the current working directory"
  puts "Make sur you run this program from the correct location !"
else
  while true
    Gem.win_platform? ? (system "cls") : (system "clear") #clear screen
    puts "\n#{filesToProcess} file(s) whithout extension in current directory and children"
    print "\nExtension to give : "
    chosenExtension = gets.champ # champ doesn't add "\n" at input's end

    if chosenExtension.empty?
      puts "Error : no input. Press ENTER to try again"
      gets
    else
      puts "\nWarning : Are you sur ?"
      puts "This will add \".#{chosenExtension}\" to current filenames"
      puts "\nPress ENTER to confirm"
      gets obj.RenameFiles(chosenExtension)
      break
    end
  end
end

puts "\End of the program. Press ENTER to exit ...\n"
gets