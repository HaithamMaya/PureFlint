f = open('flint_water_data.csv')

line_counter = 0
file_counter = 0
total_lines = 0
header = None

current_file = None

for line in f.readlines():
	if total_lines == 0:
		header = line
		total_lines = 1

	if line_counter == 0:
		file_counter = file_counter + 1
		current_file = open('flint_data/flint_file' + str(file_counter) + '.csv', 'w')
		current_file.write(header)

	current_file.write(line)
	line_counter = line_counter + 1

	if line_counter == 950:
		line_counter = 0
		current_file.close()

	print line
