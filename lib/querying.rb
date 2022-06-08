def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  INNER JOIN series 
  ON series.id = books.series_id
  WHERE books.series_id = (SELECT series_id FROM books GROUP BY title HAVING MIN(books.year))
  ORDER BY year;" 
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(*)
  FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name 
  FROM authors
  INNER JOIN series 
  ON authors.id = series.author_id
  INNER JOIN subgenres
  ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  INNER JOIN characters
  ON characters.author_id = series.author_id
  GROUP BY title
  ORDER BY COUNT(species) 
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*)
  FROM character_books
  INNER JOIN characters
  ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY COUNT(*) DESC, characters.name;"
end