# frozen_string_literal: true

class LNSGenerator
  def initialize(start)
    raise ArgumentError, 'String required' unless start.is_a?(String)

    @start = start

    raise ArgumentError, 'String should contain only digits' \
      unless is_numeric?
  end

  def next
    @start.
      each_char. # for each char
      chunk_while { |i, j| i == j }. # split by subsequence
      flat_map { |t| [t.length.to_s, t.first] }. # modify to count and first el
      join
  end

  def take(count)
    result = [@start] * count

    (1...count).each do |idx|
      result[idx] = self.class.new(result[idx - 1]).next
    end

    result
  end

  private
  # checks if initial string contains only numbers
  def is_numeric?
    @start.match(/\D/).nil?
  end
end
