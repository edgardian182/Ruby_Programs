# Save the first argument in filename
filename = ARGV.first

# Save the file loaded in the txt variable
txt = open(filename)

puts "Here's your file #{filename}: "
# print what is inside the file
print txt.read

print "Type the filename again: "
file_again = $stdin.gets.chomp

txt_again = open(file_again)

print txt_again.read