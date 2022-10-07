module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selection_of_films(array).map { |film| film['rating_kinopoisk'].to_f }.reduce(:+) / selection_of_films(array).length
      end

      def chars_count(_films, _threshold)
        0
      end

      private

      def selection_of_films(array)
        array.reject do |film|
          film['country'].nil? || film['rating_kinopoisk'].nil? || film['rating_kinopoisk'] == '0' || film['country'].split(/,/).length < 2
        end
      end
    end
  end
end
