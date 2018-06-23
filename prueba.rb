
def read_alum(file_name)
   file = File.open(file_name, 'r')
   alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
   file.close
   alum
end

# alum = read_alum("alumnos.csv")
# print alum

hash_a = {}
alum = read_alum("alumnos.csv")
alum.each do |a|
  key = a.first
  a.shift
  hash_a[key] = a
  end

#  # puts hash_a
#  print hash_a,"\n"


def calcular_promedio(hash)
 file = File.open('promedios.csv', 'w')
 hash.each do |key, value|
   suma = 0
   value.each do |n|
     suma += n.to_i
   end
  file.puts "El alumno #{key} tiene : promedio  #{suma.to_f/value.count}"
  puts "El alumno #{key} tiene : promedio  #{suma.to_f/value.count}"
  end
  file.close
   puts ''
end

# calcular_promedio(hash_a)

def contar_insistencias(hash)
  hash.each do |key, value|
    i = 0
    value.each do |n|
      i += 1 if n == 'A'
    end
    puts " El alumno #{key} tiene : inasistencias #{i}"
  end
  puts ''
end

# contar_insistencias(hash_a)

def alumnos_aprobados(hash, nota_min)
  hash.each do |key, value|
    suma = 0
    value.each do |n|
      suma += n.to_f
    end
    if suma.to_f / value.count >= nota_min
      puts "El alumno #{key} fue :aprobado"
    else
      puts "El alumno #{key} fue :reprobado"
     end
  end
 puts ''
end

# alumnos_aprobados(hash_a, 5)

  puts 'Sistema de alumnos'
  puts 'Ingresa una de estas opciones'
opcion = 0
while opcion != '4'
  puts 'Ingrese 1: nombre y promedio alumnos'
  puts 'Ingrese 2: contar inasistencias'
  puts 'Ingrese 3: alumnos aprobados'
  puts 'Ingrese 4: salir'

  opcion = gets.chomp
  case opcion
  when '1' then calcular_promedio(hash_a)
  when '2' then contar_insistencias(hash_a)
  when '3' then alumnos_aprobados(hash_a,5)
    puts 'ingrese una nota'
    nota = gets.chomp.to_i
    if nota <= 0
      puts "la nota debe ser mayor a 0 y menor que 10"
    else
      alumnos_aprobados(hash_a, nota)
    end
  else
    exit
  end
  puts "ingrese otra opción"
end
