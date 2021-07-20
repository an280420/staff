# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Division.destroy_all
PositionHistory.destroy_all
Position.destroy_all
EmploymentTerm.destroy_all
puts "Данные из базы данных удалены"

# сгенериуем 10 пользователей
10.times do
  User.create(l_name: Faker::Name.male_last_name, f_name: Faker::Name.male_first_name, s_name: Faker::Name.male_middle_name)
end

# сгенерируем дерево подразделений
# divisions 1
#           |-2
#           |-3
#             |-4
#             | |-7
#             |
#             |-5
#             | |-8
#             |   |-9
#             |
#             |-6
# 
#     подразделения     1  2  3  4  5  6  7  8  9
parent_for_divisions = [0, 1, 1, 3, 3, 3, 4, 5, 8] # массив соответствия (указываем номер родительского подразделения для каждого подразделения)
divisions = []     
1.upto(9) { |x| divisions << Division.create(name: "Подразделение №#{x}") }

divisions.each_with_index do |division, i|
  next if i == 0  # пропускаем корневое подразделение
  division.parent_id = divisions[parent_for_divisions[i] - 1].id
  division.save
end

# cгенериуем пять должностей
position_names = %w(инженер-программист бизнес-аналитик тестеровщик менеджер\ проекта ведущий\ разработчик)
position_names.each do |position_name|
  position = Position.create!
  PositionHistory.create!(name: position_name, position_id: position.id, begin_date: Date.parse('2020-12-31') )
end

# сгенериуем условия труда для двух работников
# первый юзер
EmploymentTerm.create(user_id: User.first.id, division_id: Division.first.id, position_id: Position.first.id ,begin_date: Date.parse('2020-12-31'), end_date: Date.parse('2021-04-01'))
EmploymentTerm.create(user_id: User.first.id, division_id: Division.second.id, position_id: Position.first.id ,begin_date: Date.parse('2021-04-02'), end_date: Date.parse('2021-04-10'))
EmploymentTerm.create(user_id: User.first.id, division_id: Division.third.id, position_id: Position.second.id ,begin_date: Date.parse('2021-04-11'))
# второй юзер
EmploymentTerm.create(user_id: User.second.id, division_id: Division.first.id, position_id: Position.first.id ,begin_date: Date.parse('2020-12-31'), end_date: Date.parse('2021-03-01'))
EmploymentTerm.create(user_id: User.second.id, division_id: Division.first.id, position_id: Position.second.id ,begin_date: Date.parse('2021-03-02'), end_date: Date.parse('2021-03-10'))
EmploymentTerm.create(user_id: User.second.id, division_id: Division.third.id, position_id: Position.last.id ,begin_date: Date.parse('2021-03-11'))

puts 'Сгенерированы новые данные'
