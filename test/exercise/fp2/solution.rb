module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return to_enum unless block_given?
        return [] if empty?

        yield self[0]
        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        return to_enum unless block_given?
        return [] if empty?

        my_reduce(MyArray.new) { |acc, element| acc << block.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        return [] if empty?

        temp_array = MyArray.new([])
        my_each do |item|
          temp_array << item unless item.nil?
        end
        temp_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return to_enum unless block_given?
        return [] if empty?
        return acc.nil? ? self[0] : (yield acc, self[0]) if length == 1

        yield MyArray.new(self[0..-2]).my_reduce(acc, &block), self[-1]
      end
    end
  end
end
