module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selection_of_films(array).map { |film| film['rating_kinopoisk'].to_f }.reduce(:+) / selection_of_films(array).length
      end

      def chars_count(films, threshold)
        selection_of_films_by_rating(films, threshold).map { |film| film['name'].count 'и' }.reduce(:+)
      end

      private

      def selection_of_films(array)
        array.reject do |film|
          film['country'].nil? || film['rating_kinopoisk'].nil? || film['rating_kinopoisk'] == '0' || film['country'].split(/,/).length < 2
        end
      end

      def selection_of_films_by_rating(array, rating)
        array.select { |film| film['rating_kinopoisk'].to_f >= rating }
      end
    end
  end
end
