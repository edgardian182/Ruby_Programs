=begin
1. Solicitar el peso de la persona
2. Solicitar la estatura de la persona
3.Calcular el BMI (Body Mass Index)
4. Determinar si esta bajo de peso, normal o con sobrepeso
  a. Si el BMI < 18.5 esta baja de peso
  b. Si el BMI está entre 18.5 y 24.99 esta normal
  c. Si el BMI >= 25 tiene sobrepeso
5.Imprimir el resultado
=end

print "Ingresa tu peso (kg): "
weight = gets.chomp.to_f

print "Ingresa tu estatura (m): "
height = gets.chomp.to_f

BMI = weight/height**2

puts
print "#{BMI.round(2)} "
if BMI < 18.5
  puts "(BAJA DE PESO)"
elsif BMI < 25
  puts "(NORMAL)"
else
  puts "(SOBREPESO)"
end
