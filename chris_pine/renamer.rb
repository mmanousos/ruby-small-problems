Dir.chdir # 'filepath to photos'
pic_names = Dir['F:/**/*.jpg'] # accesses all photo files
puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} files: "
pic_number = 1 # counter
pic_names.each do |name|
	print '.' # progress bar
	new_name = if pic_number < 10
		"#{batch_name}0#{pic_number}.jpg"
	else
		"#{batch_name}#{pic_number}.jpg"
	end
	File.rename name, new_name
	pic_number = pic_number + 1
end

puts # to move off of the progress bar line

puts 'All files are finished!'
