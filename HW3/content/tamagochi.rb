require 'print_html'
class Pet
  attr_accessor :name, :health, :eat, :play, :sleep, :hygiene, :tray, :mood

  def initialize (name, health, eat, play, sleep, hygiene, tray, mood)
    @name    = name
    @health  = health
    @eat     = eat
    @sleep   = sleep
    @play    = play
    @hygiene = hygiene
    @tray    = tray
    @mood    = mood
  end

  def feed
    @eat +=(5..15) if @eat.positive?
      passage_of_time
  end

  def doctor
    @health += rand(5..15)  if @health.positive?
      passage_of_time
  end


  def bed
    @sleep += rand(5..15) if @sleep.positive?
      passage_of_time
  end

  def toy
    @play += rand(5..15) if @play.positive?
      passage_of_time
  end

  def wash
    @hygiene += rand(5..15) if @hygiene.positive?
      passage_of_time
  end

  def empty_tray
    @tray += rand(5..15) if @tray.positive?
      passage_of_time
  end

  def training
    @health += rand(5..15) if @health.positive?
      passage_of_time
  end

  def to_stroke
    @mood += rand(5..15) if @mood.positive?
      passage_of_time
  end

  def scold
    @mood -= rand(5..10) if @mood.positive?
      passage_of_time
  end

  def comb_out
    @hygiene += rand(5..15) if @hygiene.positive?
      passage_of_time
  end



  private
  def passage_of_time
    @health -=rand(1..15)
    @tray -= rand(1..15)
    @hygiene -= rand(1..15)
    @eat -= rand(1..15)
    @sleep -= rand(1..15)
    @play -= rand(1..15)
    @mood -= rand(1..15)
    end
  end

  cong = "Ура теперь у вас есть "
  puts "Игра запущена"
  p "*******************"
  puts "Для начала выберите животное
  1 - Собака🐶
  2 - Кошка🐱
  3 - Попугай🐦
  4 - Горила🐒"

  choice = gets.chomp
  case choice
  when "1"
    puts cong + "Собака"
  when "2"
    puts cong + "Кошка"
  when "3"
    puts cong + "Попугай"
  when "4"
    puts cong + "Горила"
  end

  choise_str =
  case choice
  when "1"
    "Собака🐶"
  when "2"
    "Кошка🐱"
  when "3"
    "Попугай🐦"
  when "4"
    "Горила🐒"
  end


  puts " "


  print "Введите название питомца: "
  p
  name = gets.chomp().capitalize
  pet = Pet.new(name, 100, 100, 100, 100, 100, 100, 100 )
  puts
  puts ("    Родился(лась)  #{choise_str}" + ' ' +pet.name)
  puts
  puts "\nЗдоровья\t#{pet.health}\nСытость\t\t#{pet.eat}\nЕнергия\t\t#{pet.sleep}\nНастроение\t#{pet.play}\nГигиена\t\t#{pet.hygiene}\nЧистота лотка\t#{pet.tray}\nНастроение\t#{pet.mood}"
  puts ""
  puts "Вы проверяете показатели питомца: "
  begin
  print "*******************"
  puts "\n|Здоровья\t#{pet.health -= rand(20)}|\n|Сытость\t#{pet.eat -= rand(20)}|\n|Енергия\t#{pet.sleep -=rand(20)}|\n|Настроение\t#{pet.play -= rand(20)}|\n|Гигиена\t#{pet.hygiene -=rand(20)}|\n|Чистота лотка \t#{pet.tray -=rand(20)}|\n|Настроение\t#{pet.mood -=rand(20)}|"
  print "*******************"
  puts "\nЧто вы хотите сделать с #{choise_str}(ой) #{pet.name}:
  1 - Сходить к врачу         6 - Почистить лоток
  2 - Пококормить             7 - Тренировка
  3 - Уложить спать           8 - Погладить
  4 - Поиграть                9 - Наругать
  5 - Покупать                10 - Вычесать шерсть

  Нажмите Enter что бы ничего не делать..."


  if pet.health != 0
  stats = gets.chomp()
  case stats

  when "1"
  print "Вы повели #{choise_str}(у) #{pet.name} к врачу!🏥 "
    pet.doctor
      print " #{pet.name} лечится!"

  when "2"
  print "Вы насыпали еду 🍗 #{choise_str}(е)"
    pet.feed
      print " #{pet.name} ест!"

  when "3"
  print "#{choise_str}(а) #{pet.name} пошел(ла) спать.💤💤💤."
    pet.bed
      print " #{pet.name} спит..."

  when "4"
  print "Вы играете 🏀 с #{choise_str}(ой) #{pet.name}."
    pet.toy
      print " #{pet.name} играет!"

  when "5"
  print "Вы купаете 🛀 #{choise_str}(у) #{pet.name}."
    pet.wash
      print " #{pet.name} стал чище!"

  when "6"
  print "Вы убираете лоток 💩."
    pet.empty_tray
      print " #{choise_str}(а) #{pet.name} доволен чистым лотком!"

  when "7"
  print "Вы тренируете 🦴 #{choise_str}(у) #{pet.name}."
    pet.training
      print " #{pet.name} устал!"

  when "8"
  print "Вы гладите 💖💖💖 #{choise_str}(у) #{pet.name}."
    pet.to_stroke
      print " #{pet.name} доволен!"

  when "9"
  print "Вы наругали 😠 #{choise_str}(у) #{pet.name}."
    pet.scold
      print " #{pet.name} расстроился!"

  when "10"
  print "Вы вычесываете 👋 шерсть.#{choise_str}(ке) #{pet.name}."
    pet.comb_out
      print " #{pet.name} злиться!"

  when ""
    print "Вы выбрали не делать ничего 🕜!"
    pet.hygiene -= (10)
    pet.tray -= (10)
    pet.health -= rand(10)
    pet.eat -= rand(10)
    pet.sleep -= rand(10)
    pet.play -= rand(10)
    pet.mood -= rand(10)
p " "
  p "Выберите действие от 1 до 10"


  else
  puts "Вы ввели #{stats}, что-то не так!"
  print "Попробуйте сновa! "
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
  elsif pet.mood <= 0
    pet.mood = 0
      print "\n\nУ #{pet.name} Депрессия !!! Конец игры!"
    end
  puts "\nЗдоровья\t#{pet.health}\nСытость\t\t#{pet.eat}\nЕнергия\t\t#{pet.sleep}\nНастроение\t#{pet.play}\nГигиена\t\t#{pet.hygiene}\nЧистота лотка\t#{pet.tray}\nНастроение\t#{pet.mood}"
  end  while pet.health > 0 && pet.eat > 0 && pet.sleep > 0 && pet.play > 0 && pet.hygiene > 0 && pet.tray > 0 && pet.mood > 0
end
  p "#{pet.name} Умер! Конец."
