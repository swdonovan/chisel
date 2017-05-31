require 'pry'


class Chisel
	attr_reader :contents,
							:converted

	def initialize
		@contents = File.readlines(ARGV[0])
		@final = ""
		@counter = 0
		runner
	end

	def runner
		check_lines
	end

	def check_lines
		@converted = ""
		@contents.map do |line|
			if line.include?("#")
				line.chomp!
				hash_symb_convert(line)
			elsif line.include?("\n")
				carriage_symb_convert(line)
			end
			@final << @converted
			binding.pry
		end
	end

	def hash_symb_convert(line)
		line = line.split(/(\W)/)
		line.select do |word|
			binding.pry
			@converted << word if word != "#"
			@converted << (word = double_hash_symb_convert) if word == "##"
			@converted << (word = hash_convert) if word == "#"
		end
		@converted << hash_convert
	end

	def carriage_symb_convert(line)
		line = line.split(/(\W)/)
		binding.pry
		if line.inspect == "[\"\", \"\\n\"]"
			return
		else
			@converted = line.inject("") do |start, word|
				start << word if word != "\n"
				start << (word = carriage_convert) if word == "\n";
				start
			end
		end
		@converted.insert(0, carriage_convert)
	end

	def double_hash_symb_convert(line)
		line = line.split(/(\W)/)
		binding.pry
		@converted = line.inject("") do |start, word|
			start << word if word != "##"
			start << word = double_hash_convert if word == "##";
			start
		end
		@converted << hash_convert
	end

	def doublt_hash_convert
		"<h2>"
	end

	def symbols
		"#\n"
	end

	def carriage_convert
		"<p>"
	end

	def hash_convert
		"<h1>"
	end
end
