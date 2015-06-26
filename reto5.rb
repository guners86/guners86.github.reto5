class Survey
  
  attr_accessor :questions
  
  def initialize()
    
    @questions = Hash.new
    cont = 1 #contador que se utiliza para saber si la linea que se lee de un archivo es una pregunta o la respuesta
    is_definition = true
    question = ''
    answer = ''
    
    File.open('Survey.txt', 'r') do |f1|
      while linea = f1.gets

        if cont % 2 == 0
          is_definition = false
        else
          is_definition = true
        end
        
        if is_definition
          question = linea
        else 
          answer = linea.chomp
        end
        
        if answer != ''
          @questions[question] = answer
        end
        
        answer = ''
        cont += 1
        
      end
    end
    
  end
  
end

class Reto
  
  def play
    
    number_attempts = 0
    number_questions = 0
    
    puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
    
    sur = Survey.new
    
    sur.questions.each do |key, value|
      
      puts "";
      
      number_attempts += 1
      number_questions += 1
      
      puts "Pregunta: #{key}"
      puts "Respuesta:"
      answer =  gets.chomp
      answer = answer.downcase
      
      while answer != value.downcase do
        puts "";
        puts 'Incorrecto!, Trata de nuevo' 
        puts "Pregunta: #{key}"
        puts "Respuesta:"
        answer = gets.chomp
        answer = answer.downcase
        number_attempts += 1;
      end
      
      puts 'Correcto!' 
      
    end
    
    puts "";
    puts "Haz terminado el juego, con un total de #{number_attempts} intentos, para #{number_questions} preguntas"
    
  end
  
end

game = Reto.new
game.play