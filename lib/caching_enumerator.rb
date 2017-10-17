class CachingEnumerator < Enumerator
	def initialize(&block)
		@cache = []
		@enum = Enumerator.new(&block)

		super do |yielder|
			@cache.each do |person|
				yielder.yield person
			end

			begin
				loop do
					next_val = @enum.next
					@cache.push next_val
					yielder.yield next_val
				end
			rescue StopIteration
			end
		end
	end

	def reset
		@cache = []
		@enum.rewind
		self.rewind
	end
end

require "caching_enumerator/version"
