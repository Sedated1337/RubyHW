p "Первое задание"
numbers = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]

p "1. Узнать количество элементов в массиве"
nums = numbers.size
p nums

p "2. Перевернуть массив"
numr = numbers.reverse
p numr

p "3. Найти наибольшее число"
nummax = numbers.max
p nummax

p "4. Найти наименьшее число"
nummin = numbers.min
p nummin

p "5. Отсортировать от меньшего к большему"
numsort = numbers.sort 
p numsort

p "6. Отсортировать от большего к меньшему"
numsr = numbers.sort.reverse
p numsr

p "7. Удалить все нечетные числа"
def delnum
numdel = numbers.delete_if &:odd?
p numdel
end

p "8. Оставить только те числа, которые без остатка делятся на 3"
num3 = numbers.find_all { |q| q%3 == 0}
p num3.uniq

p "9. Удалить из массива числа, которые повторяются (то есть, нужно вывести массив, в котором нет повторов"
numuq = numbers.uniq
p numuq

p "10. Разделить каждый элемент на 10, в результате элементы не должны быть округлены до целого;"
q = numbers.map {|a| a/10}
p q

p "11. Получить новый массив, который бы содержал в себе те буквы английского алфавита,
порядковый номер которых есть в нашем массиве"
p numbers
numbers2 = []
numbers3 = []
numbers2[1..26] = ('a'..'z').to_a
numbers.each do |el|
numbers3 << numbers2.values_at(el) if el<= (numbers2.size - 1)
end
p numbers3.flatten

p "12. Поменять местами минимальный и максимальный элементы массива "
numbersrev = numbers
i = numbers.each_with_index.min[1]
j = numbers.each_with_index.max[1]
numbers[i],numbers[j]=numbers[j],numbers[i]
p numbersrev

p "13. Найти элементы, которые находятся перед минимальным числом в массиве "
min = numbers.min
l1 = numbers.take_while { |n| n != min }
p l1

p "14. Необходимо найти три наименьших элемента "
minnum = numbers
min_arr = Array.new
3.times do 
min_arr << minnum.min
p minnum.delete(minnum.min)
end



