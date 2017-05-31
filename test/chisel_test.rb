require 'minitest/autorun'
require 'minitest/emoji'
require 'minitest/pride'
require_relative '../lib/chisel'
require 'pry'

class ChiselTest < Minitest::Test

	def test_if_chisel_inits
		actual = Chisel.new
		expected = Chisel

		assert_instance_of expected, actual
	end

	def test_if_file_reads
		actual = Chisel.new.contents

		refute_nil actual
	end

	def test_if_it_converts_hashes
		actual = Chisel.new.converted
		expected = "<h1> Hello How<h1>"

		assert_equal expected, actual
	end

	def test_if_it_converts_carriage_returns
		actual = Chisel.new.converted
		expected = "<h1> Hello How<h1>"

		assert_equal expected, actual
	end

	def test_if_it_joins_converted
		actual = Chisel.new.converted
		expected = "<h1> Hello How<h1>"

		assert_equal expected, actual
	end
end
