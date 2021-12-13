# frozen_string_literal: true
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
Encoding.default_internal = __ENCODING__

[$stdin, $stdout].each do |io|
  io.set_encoding(Encoding.default_external, Encoding.default_internal)
end
end

class Pet
  attr_accessor :name, :health, :eat, :play, :sleep, :hygiene, :tray

  def initialize(name, health, eat, play, sleep, hygiene, tray)
    @name = name
    @health = health
    @eat = eat
    @sleep = sleep
    @play = play
    @hygiene = hygiene
    @tray = tray
  end
                # Выдает ошибку
                # private
                # def sell_pet
              # pet.health -= rand(99)
              # pet.tray -= rand(99)
              # pet.hygiene -= rand(99)
              # pet.eat -= rand(99)
              # pet.sleep -= rand(99)
              # pet.play -= rand(99)
              # end
    # end
end

cong = 'Ура теперь у вас есть '
puts 'Игра запущена'
p '*******************'
puts "Для начала выберите животное
  1 - Собака
  2 - Кошка
  3 - Попугай
  4 - Горила"

choice = gets.chomp
case choice
when '1'
  puts cong + 'Собака'
when '2'
  puts cong + 'Кошка'
when '3'
  puts cong + 'Попугай'
when '4'
  puts cong + 'Горила'
end

choise_str =
  case choice
  when '1'
    'Собака'
  when '2'
    'Кошка'
  when '3'
    'Попугай'
  when '4'
    'Горила'
  end

classpet = cong + choise_str

puts ' '


print 'Введите название питомца: '
p
name = gets.chomp.to_s
pet = Pet.new(name, 100, 100, 100, 100, 100, 100)
puts
puts("    Родился(лась)  #{choise_str}" + ' ' + pet.name)
puts
puts "\nЗдоровья\t#{pet.health}\nСытость\t\t#{pet.eat}\nЕнергия\t\t#{pet.sleep}\nНастроение\t#{pet.play}\nГигиена\t\t#{pet.hygiene}\nЧистота лотка\t#{pet.tray}"
puts ''
puts 'Вы проверяете показатели питомца: '
begin
  print '*******************'
puts "\n|Здоровья\t#{pet.health -= rand(20)}|\n|Сытость\t#{pet.eat -= rand(20)}|\n|Енергия\t#{pet.sleep -= rand(20)}|\n|Настроение\t#{pet.play -= rand(20)}|\n|Гигиена\t#{pet.hygiene -= rand(20)}|\n|Чистота лотка \t#{pet.tray -= rand(20)}|"
print '*******************'
puts "\nЧто вы хотите сделать с #{choise_str}(ой) #{pet.name}:
  1 - Сходить к врачу         6 - Почистить лоток
  2 - Пококормить             7 - Тренировка
  3 - Уложить спать           8 - Погладить
  4 - Поиграть                9 - Наругать
  5 - Покупать                10 - Вычесать шерсть

  Нажмите Enter что бы ничего не делать..."

next unless pet.health != 0
  diya = gets.chomp.to_s
case diya

when '1'
  print "Вы повели #{choise_str}(у) #{pet.name} к врачу! "
pet.health += rand(15) if pet.health > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  pet.play -= rand(10)
  print " #{pet.name} лечится!"

when '2'
  print "Вы насыпали еду #{choise_str}(е)"
pet.eat += rand(15) if pet.eat > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.health -= rand(10)
  pet.sleep -= rand(10)
  pet.play -= rand(10)
  print " #{pet.name} ест!"

when '3'
  print "#{choise_str}(а) #{pet.name} пошел(ла) спать.Zzzzzz."
pet.sleep += rand(15) if pet.sleep > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.health -= rand(10)
  pet.eat -= rand(10)
  pet.play -= rand(10)
  print " #{pet.name} спит..."

when '4'
  print "Вы играете с #{choise_str}(ой) #{pet.name}."
pet.play += rand(15) if pet.play > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.health -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  print " #{pet.name} играет!"

when '5'
  print "Вы купаете #{choise_str}(у) #{pet.name}."
pet.hygiene += rand(15) if pet.hygiene > 0
  pet.tray -= 10
  pet.play -= 10
  pet.health -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  print " #{pet.name} стал чище!"

when '6'
  print 'Вы убираете лоток.'
pet.tray += rand(15) if pet.tray > 0
  pet.hygiene -= 10
  pet.play -= 10
  pet.health -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  print " #{choise_str}(а) #{pet.name} доволен чистым лотком!"

when '7'
  print "Вы тренируете #{choise_str}(у) #{pet.name}."
pet.health += rand(15) if pet.health > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.play += rand(2)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  print " #{pet.name} устал!"

when '8'
  print "Вы гладите #{choise_str}(у) #{pet.name}."
pet.play += rand(15) if pet.play > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.health -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  print " #{pet.name} доволен!"

when '9'
  print "Вы наругали #{choise_str}(у) #{pet.name}."
pet.play -= rand(20) if pet.play > 0
  pet.tray -= rand(5)
  pet.hygiene -= rand(5)
  pet.health -= rand(5)
  pet.eat -= rand(5)
  pet.sleep -= rand(5)
  print " #{pet.name} расстроился!"

when '10'
  print "Вы вычесываете шерсть.#{choise_str}(ке) #{pet.name}."
pet.hygiene += rand(20) if pet.play > 0
  pet.tray -= rand(10)
  pet.hygiene -= rand(10)
  pet.play -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  print " #{pet.name} злиться!"

when ''
  print 'Вы выбрали не делать ничего!'
  pet.hygiene -= 10
  pet.tray -= 10
  pet.health -= rand(10)
  pet.eat -= rand(10)
  pet.sleep -= rand(10)
  pet.play -= rand(10)
else
  puts "Вы ввели #{diya}, что-то не так!"
  print 'Попробуйте сновa! '
next
end
if pet.health <= 0
  pet.health = 0
  print "\n\n#{pet.name} умер от болезни!!! Конец игры!"
elsif pet.eat <= 0
  pet.eat = 0
  print "\n\n#{pet.name} скушал вас!!! Конец игры!"
elsif pet.sleep <= 0
  pet.sleep = 0
  print "\n\n#{pet.name} умер от недосыпа!!! Конец игры!"
elsif pet.play <= 0
  pet.play = 0
  print "\n\n#{pet.name} умер от скуки!!! Конец игры!"
elsif pet.tray <= 0
  pet.tray = 0
  print "\n\n#{pet.name} убежал от вас!!! Конец игры!"
elsif pet.hygiene <= 0
  pet.hygiene = 0
  print "\n\n#{pet.name} стал комком грязи!!! Конец игры!"
end
  puts "\nЗдоровья\t#{pet.health}\nСытость\t\t#{pet.eat}\nЕнергия\t\t#{pet.sleep}\nНастроение\t#{pet.play}\nГигиена\t\t#{pet.hygiene}\nЧистота лотка\t#{pet.tray}"
 while pet.health > 0 && pet.eat > 0 && pet.sleep > 0 && pet.play > 0 && pet.hygiene > 0 && pet.tray > 0
end
p "#{pet.name} Умер! Конец."
