=begin
  1. Repartir las cartas
  2. Preguntar al ususario si desea carta o se planta
    a. Si pide carta
      I. Si se pasa ir al punto 4
      II. De lo contrario volver al punto 2
    b. Si se planta
      I. Continuar al punto 3
  3. Determinar el valor de la mano del repartidor
    a. Si es < 17, entregarse otra carta
      I. Si se pasa ir al punto 4
      II. De lo contrario volver al punto 3
    b. De lo contrario ir al punto 4
  4. Determinar ganador
    a. Si el usuario se paso gana el repartidor
    b. Si repartidor se paso gana usuario
    c. Si tienen el mismo valor quedaron empatados
    d. Si el repartidor tiene más que el usuario gana el repartidor
    e. De lo contrario gana el usuario
  5. Volver al punto 1 (Nuevo juego)
=end

# ESTRUCTURA DE DATOS
# Necesitamos definir una representación de los elementos del juego
# Cómo representamos una carta?
# Cómo representamos una baraja?
# Cómo representamos las cartas que tiene el repartidor y el jugador?

# +++++++++++++++ ESTRUCTURA DE DATOS +++++++++++++++

class Card

  attr_reader :suit

  def initialize(suit, value)
    @value = value
    @suit = suit
  end

  def value
    return 10 if ["J", "Q", "K"].include?(@value)
    return 11 if @value == "A"
    return @value
  end

  # Metodo usado par sobreescribir "to_s" y mostrar el valor de las cartas
  def to_s
    "#{@value}-#{@suit}"
  end

end

# La baraja es un conjunto de cartas pero al encapdularlo en una clase va a ser más facil de manejar

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    build_cards
  end

  # Toma la primera "carta" (Elemento del Array) y lo saca del mismo
  # Como este metodo va a cambiar la estructura del objeto DECK al sacarle un elemento lo representamos con un "!" al final
  def take!
    @cards.shift
  end

  private
    def build_cards
      [:clubs, :diamonds, :spades, :hearts].each do |suit|
        (2..10).each do |number|
          @cards << Card.new(suit, number)
        end
        ["A", "J", "Q", "K"].each do |face|
          @cards << Card.new(suit, face)
        end
      end
      @cards.shuffle!
    end
end

# Por cada OBJETO que representemos en la APP vamos a construir una CLASE que lo cree
# Ahora construiremos la clase HAND para crear la mano tanto del Dealer com odel Player

class Hand
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  # Como este metodo va a cambiar la estructura o estado del objeto DECK (En este caso sacar "Cartas" del mismo), se define el método con un "!" al final
  def hit!
    @cards << @deck.take!
  end

  def value
    val = 0
    @cards.each do |card|
      val += card.value
    end
    val
  end

  # Metodo usado para sobreescribir la salida de la HAND como String y mostrar las cartas
  def to_s
    # Cadena de texto con las cartas de la HAND (Se usa para mostrar las cartas)
    # Con el método "to_s" en la clase CARD mostramos el valor y la pinta de las cartas que cumple con una función similar al "to_s" creado para HAND aca.
    str = ""
    @cards.each do |card|
      str += "#{card}    "
    end
    str.strip
  end
end

# +++++++++++++++ ESTRUCTURA DE DATOS (FIN) +++++++++++++++

# +++++++++++++++ LOGICA DE DATOS +++++++++++++++

# 1. REPARTIR LAS CARTAS

# Definimos la Baraja y las manos del jugador y el repartidor
deck = Deck.new
dealer = Hand.new(deck)
player = Hand.new(deck)

# Damos cartas a las manos del jugador y el repartidor
player.hit!
player.hit!
dealer.hit!

# Usamos un metodo "to_s" para sobreescribir la salida de datos mostrada y no usar el nombre que da por defecto Ruby al objeto de las HANDS
puts "Repartidor: #{dealer}  [#{dealer.value}]"
puts "Jugador:    #{player}  #{player.value < 21 ? [player.value] : "BlackJack"}"
puts

# 2. PREGUNTAR AL JUGADOR SI DESEA CARTA O SE PLANTA

# Como existe algo que se repite lo mejor es encerrarlo en un Ciclo
while player.value < 21
  puts "Tu turno: "
  print "  ¿Carta(C) o plantas(P)? "
  option = gets.chomp
  if option == "C"
    player.hit!
    puts "  #{player}    [#{player.value}]"
    puts
  elsif option == "P"
    break
  end
end

# 3. DETERMINAR VALOR MANO DEL REPARTIDOR

if player.value <= 21
  puts
  puts "Turno del repartidor: "
  dealer.hit!
  puts "  #{dealer}  [#{dealer.value}]"
  while dealer.value < 17
    dealer.hit!
    puts "  #{dealer}  [#{dealer.value}]"
  end
end

# 4. DETERMINAR GANADOR

puts
if player.value > 21
  puts "Perdiste :("
elsif dealer.value > 21
  puts "Ganaste :)"
elsif dealer.value == player.value
  puts "Empatados :|"
elsif dealer.value > player.value
  puts "Perdiste :("
else
  puts "Ganaste :)"
end


# +++++++++++++++ LOGICA DE DATOS (FIN) +++++++++++++++