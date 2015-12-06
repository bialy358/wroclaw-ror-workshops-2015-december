puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

mr_stefan = Teacher.create!(first_name: 'Stefan', last_name: 'Koziaczek', academic_title: 'Prof.')
bruce_lee = Teacher.create!(first_name: 'Bruce', last_name: 'Lee', academic_title: 'Dr.')
king_pin = Teacher.create!(first_name: 'Peter', last_name: 'King', academic_title: 'TA')

SubjectItem.create!(title: 'Robotics', teacher: mr_stefan)
SubjectItem.create!(title: 'SPC in production', teacher: bruce_lee)
SubjectItem.create!(title: 'Service of NC machine tools', teacher: bruce_lee)
SubjectItem.create!(title: 'Mathematics', teacher: mr_stefan)
SubjectItem.create!(title: 'Labor Law', teacher: king_pin)

student_list= [{first_name: 'Anna', last_name: 'Klos', birthdate: '1988-11-01' },
          {first_name: 'Gregory', last_name: 'Nowak', birthdate: '1954-10-23'},
          {first_name: 'Harry', last_name: 'Kregowicz', birthdate: '1969-09-09'},
          {first_name: 'James', last_name: 'Iwanowicz', birthdate: '1978-12-15'},
          {first_name: 'Alfred', last_name: 'Kolwiekowicz', birthdate: '1980-04-24'},
          {first_name: 'Nickie', last_name: 'Dyzma', birthdate: '1981-07-06'},
          {first_name: 'Christopher', last_name: 'Bond', birthdate: '1982-07-17'},
          {first_name: 'Kate', last_name: 'Bloufeld', birthdate: '1983-01-21'},
          {first_name: 'Sue', last_name: 'Belly', birthdate: '1984-04-19'},
          {first_name: 'David', last_name: 'Simpson', birthdate: '2000-12-12'},
          {first_name: 'Natalie', last_name: 'Kratnik', birthdate: '1999-05-25'},
          {first_name: 'Michael', last_name: 'Mazur', birthdate: '1975-01-30'},
          {first_name: 'John', last_name: 'Dudek', birthdate: '1995-12-31'},
          {first_name: 'Paul', last_name: 'Krawczyk', birthdate: '1996-04-04'},
          {first_name: 'Peter', last_name: 'Krol', birthdate: '1990-06-24'},
          {first_name: 'Frank', last_name: 'Sikora', birthdate: '1975-09-16'},
          {first_name: 'Arthur', last_name: 'Zajac', birthdate: '1964-08-11'},
          {first_name: 'Hubert', last_name: 'Szulc', birthdate: ''},
          {first_name: 'John', last_name: 'Brok', birthdate: ''},
          {first_name: 'Martin', last_name: 'Lis', birthdate: ''},
          {first_name: 'Milo', last_name: 'Wilk', birthdate: ''},
          {first_name: 'Victor', last_name: 'Kozak', birthdate: ''},
          {first_name: 'Stanley', last_name: 'Polak', birthdate: ''},
          {first_name: 'Mark', last_name: 'Wojcik', birthdate: ''},
          {first_name: 'Anna', last_name: 'Gajda', birthdate: ''},
          {first_name: 'Will', last_name: 'Mysz', birthdate: ''},]
student_list.each {|params| Student.create!(params)}

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      student.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
