require "test_helper"

class CachingEnumeratorTest < Minitest::Test
	def test_that_it_has_a_version_number
		refute_nil ::CachingEnumerator::VERSION
	end

	def test_does_it_cache

		very_expensive_operation_count = 0

		x = CachingEnumerator.new do |yielder|
			5.times do |i|
				very_expensive_operation_count += 1
				yielder.yield i
			end
		end

		assert_equal [0, 1, 2], x.take(3)
		assert_equal 3, very_expensive_operation_count

		assert_equal [0, 1], x.first(2)
		assert_equal 3, very_expensive_operation_count

		assert_equal [0, 1, 2, 3, 4], x.take(5)
		assert_equal 5, very_expensive_operation_count

		assert_equal [0, 1, 2, 3, 4], x.take(7)
		assert_equal 5, very_expensive_operation_count

		assert_equal 0, x.next
		assert_equal 1, x.next
		assert_equal 2, x.next
		assert_equal 3, x.next
		assert_equal 4, x.next
		assert_raises(StopIteration) do
			x.next
		end

		x.rewind
		assert_equal 0, x.next
		assert_equal 5, very_expensive_operation_count

		assert_equal 0, x.reset.next
		assert_equal 6, very_expensive_operation_count

	end
end
