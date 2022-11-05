module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        return to_enum unless block_given?
        return [] if empty?

        for item in self
          yield(item)
        end
      end

      # Написать свою функцию my_map
      def my_map
        return to_enum unless block_given?
        return [] if empty?

        temp_array = MyArray.new([])
        for item in self
          temp_array << yield(item)
        end
        temp_array
      end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        return to_enum unless block_given?
        return [] if empty?

        return self[0] if length == 1

        if args[0].present?
          insert(0, args[0])
          acc = args[0]
        else
          acc = self [0]
        end

        MyArray.new(self[1..size]).my_each do |element|
          acc = yield(acc, element)
        end
        shift if args[0].present?
        acc
      end
    end
  end
end
