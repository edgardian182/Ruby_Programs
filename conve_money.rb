require 'money'
require 'money/bank/google_currency'

Money.default_bank = Money::Bank::GoogleCurrency.new
Money.use_i18n = false

puts "¡Bienvenido a ConveMoney! La forma más facil de convertir dinero a diferentes monedas"
puts
puts "Ejemplos: "
puts "  2000 USD a COP"
puts "  100 EUR a BRL"
puts

print ">"
str = gets.chomp.strip

tokens = str.split
amount = tokens[0].to_f
origin_cur = tokens[1]
target_cur = tokens[3]

currency = Money::Currency.wrap(origin_cur)

money = Money.new(amount * currency.subunit_to_unit, origin_cur)
result = money.exchange_to(target_cur)

puts
puts "#{money.format} #{origin_cur} = #{result.format} #{target_cur}"