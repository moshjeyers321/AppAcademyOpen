
def first_anagram?(word1, word2)
  letters = word1.split("")
  sets = letters.permutation(word1.length).to_a
  sets.any? { |set| set.join("") == word2}
  
end

# word1 = "gizmo"
# word2 = "sally"
# p first_anagram?(word1, word2)

# word1 = "elvis"
# word2 = "lives"
# p first_anagram?(word1, word2)


def second_anagram?(word1, word2)
  a, b = word1.split(''), word2.split('')
  
  a.each do |char|
    i = b.find_index(char)
    return false if !i
    b.delete_at(i)
  end
  
  b.length == 0
  
end

# word1 = "gizmo"
# word2 = "sally"
# p second_anagram?(word1, word2)

# word1 = "elvis"
# word2 = "lives"
# p second_anagram?(word1, word2)

# p second_anagram?("racecar", "racer")


def third_anagram?(word1, word2)
  a, b = word1.split(''), word2.split('')

  a.sort == b.sort
end

# word1 = "gizmo"
# word2 = "sally"
# p third_anagram?(word1, word2)

# word1 = "elvis"
# word2 = "lives"
# p third_anagram?(word1, word2)

# p third_anagram?("racecar", "racer")

def fourth_anagram?(word1, word2)
  hash1, hash2 = Hash.new { |h, k| h[k] = 0}, Hash.new { |h, k| h[k] = 0}

  word1.each_char do |char|
    hash1[char] += 1
  end

  word2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

# word1 = "gizmo"
# word2 = "sally"
# p fourth_anagram?(word1, word2)

# word1 = "elvis"
# word2 = "lives"
# p fourth_anagram?(word1, word2)

# p fourth_anagram?("racecar", "racer")

def fourth_anagramb?(word1, word2)
  hash1 = Hash.new { |h, k| h[k] = 0}

  word1.each_char do |char|
    hash1[char] += 1
  end

  word2.each_char do |char|
    hash1[char] -= 1
  end

  hash1.each_value { |v| return false if v != 0}
  true
end


word1 = "gizmo"
word2 = "sally"
p fourth_anagramb?(word1, word2)

word1 = "elvis"
word2 = "lives"
p fourth_anagramb?(word1, word2)

p fourth_anagramb?("racecar", "racer")