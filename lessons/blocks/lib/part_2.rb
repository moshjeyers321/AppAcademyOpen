require "byebug"

def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize}
end

def no_valid_url?(urls)
    good_urls = ['.com', '.net', '.io', '.org']

    
    urls.none? do |url|
        good_urls.any? { |good| url.end_with?(good)}
    end
    
end

def any_passing_students?(students)
    students.any? do |student|
        (student[:grades].sum) / (student[:grades].length * 1.0) >= 75
    end
end