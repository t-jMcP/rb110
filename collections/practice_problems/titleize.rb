def titleize(text)
  titleized_text = text[0].capitalize

  counter = 1
  
  while counter < text.length
    if text[counter - 1] == " "
      titleized_text << text[counter].capitalize
    else
      titleized_text << text[counter]
    end

    counter += 1
  end
  
  titleized_text
end

words = "the flintstones rock"

puts titleize(words)
