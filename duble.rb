
datafile = File.open "data.txt", "r"
userarray = []

while line = datafile.gets
    userarray << line
end


puts userarray.uniq.size
datafile.close
