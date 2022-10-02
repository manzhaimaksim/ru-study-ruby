module Exercise
  module Arrays
    class << self
      def max(array)
        array.reduce(array[0]) { |max_value, element| element > max_value ? element : max_value }
      end

      def replace(array)
        array.map { |element| element.positive? ? max(array) : element }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
