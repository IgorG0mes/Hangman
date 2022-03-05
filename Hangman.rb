class Hangman

	def initialize
    choose_word
    @lives = 7
    @word = @array[0]       
    @preview = @array[1]
    @space = config_space
  end

  def choose_word
    @array = word_list.sample 
  end

  def config_space
    ["_"] * @word.size
  end

  def space_state 
    @space.join(" ")    
  end

  def word_list
    [
      ["brasil", "Quinto maior país do mundo"],
      ["girafa", "Animal da savana africana"],
      ["geladeira", "Eletrodoméstico"],
      ["rock", "Estilo musical"],
    	["celular", "Aparelho eletrônico"]
  	]
  end

  def letter
    print "Digite uma letra: "
    gets.chomp
  end

  def size_letter
    "\nA palavra possui #{@word.size} letras"    
  end

  def live_remaining
    puts "\nVocê possui #{@lives} vidas restante."    
  end

  def update_space(guess)
    if @word.include?(guess)
      i = 0
      while i < @word.size
        @space[i] = @word[i] if guess == @word[i]
        i += 1
      end
    else
      @lives -= 1
    end
  end

  def begin
    system('cls')
    puts "Bem vindo ao Jogo da Forca!"
    while @lives > 0 && !won?
      puts live_remaining
      puts "A dica é: #{@preview}"
      puts space_state
      puts size_letter
      guess = letter
      update_space(guess)
      system('cls')
    end

    if won?
      puts "\nA palavra era: #{@word} \nParabéns, você venceu!"
    else
      puts "\nVocê perdeu... Tente novamente!"
    end
  end

  def won?
  	@space.join("") == @word
  end
end

game = Hangman.new
game.begin