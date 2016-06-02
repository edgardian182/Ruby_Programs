# Vamos a usar una libreria de Ruby = GEMA
# Existen para casi cualqueir cosa
# Pensadas para desarrolladores que crean aplicaciones para usuarios finales

# Usaremos una para hacer conversiones entre monedas con tasa del día de hoy (Google Currency)

# Para descargar una libreria solo hay que usar gem install google_currecny
#  Siempre que se va a trabajar con una gema hay que REQUERIRLA

require 'money'
require 'money/bank/google_currency'

Money::Bank::GoogleCurrency.ttl_in_seconds = 86400

Money.default_bank = Money::Bank::GoogleCurrency.new
Money.use_i18n = false

puts "Las tasas hoy son: "
puts "  Dolar: #{Money.new(100, "USD").exchange_to(:COP).format} COP"
puts "  Euro:  #{Money.new(100, :EUR).exchange_to(:COP).format} COP"
puts "  Yuan:  #{Money.new(100, :CNY).exchange_to(:COP).format} COP"
