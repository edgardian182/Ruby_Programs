require 'fileutils'

file_1, file_2 = ARGV

FileUtils.cp(file_1, file_2)