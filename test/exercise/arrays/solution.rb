module Exercise
  module Arrays
    class << self
      def max(array)
        array.reduce(array[0]) { |max_value, element| element > max_value ? element : max_value }
      end

      def replace(array)
        array.map { |element| element.positive? ? max(array) : element }
      end

      def search(array, query)
        search_helper(array, query, 0, array.length)
      end

      def search_helper(array, query, start_index, end_index)
        middle_index = (start_index + end_index) / 2

        return -1 if start_index == end_index

        if array[middle_index] > query
          search_helper(array, query, start_index, middle_index)
        elsif array[middle_index] < query
          search_helper(array, query, middle_index + 1, end_index)
        else
          middle_index
        end
      end
    end
  end
end
