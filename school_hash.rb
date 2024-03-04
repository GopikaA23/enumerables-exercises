school_hash = [
  { teacher: 'Raju', student: 'Guru', subject: 'History', mark1: '100', mark2: '100', gender: 'male' },
  { teacher: 'Shanta', student: 'Murali', subject: 'Geography', mark1: '80', mark2: '60', gender: 'male' },
  { teacher: 'Prabhu', student: 'Guru', subject: 'Maths', mark1: '90', mark2: '95', gender: 'male' },
  { teacher: 'Raju', student: 'Murali', subject: 'Civics', mark1: '100', mark2: '100', gender: 'male' },
  { teacher: 'Raju', student: 'Guru', subject: 'Civics', mark1: '85', mark2: '80', gender: 'male' },
  { teacher: 'Raju', student: 'Jansi', subject: 'Civics', mark1: '80', mark2: '70', gender: 'female' },
  { teacher: 'Raju', student: 'Jansi', subject: 'History', mark1: '100', mark2: '70', gender: 'female' },
  { teacher: 'Raju', student: 'Murali', subject: 'History', mark1: '70', mark2: '100', gender: 'male' },
  { teacher: 'Shanta', student: 'Guru', subject: 'Geography', mark1: '80', mark2: '90', gender: 'male' },
  { teacher: 'Shanta', student: 'Jansi', subject: 'Geography', mark1: '60', mark2: '100',
    gender: 'female' },
  { teacher: 'Prabhu', student: 'Murali', subject: 'Maths', mark1: '100', mark2: '85', gender: 'male' },
  { teacher: 'Prabhu', student: 'Jansi', subject: 'Maths', mark1: '100', mark2: '90', gender: 'female' }
]

# 1) Has teacher Shanta taught a student who has secured 80% marks and above on an average?

school_hash
  .filter { |x| x[:teacher] == 'Shanta' && (x[:mark1].to_i + x[:mark2].to_i) / 2 >= 80 }
  .map { |x| x[:student] }

# 2) List the names of students and teachers.

school_hash.map { |i| i[:student] }.uniq
school_hash.map { |i| i[:teacher] }.uniq

# 3) How many subjects does Murali study?

school_hash.select { |i| i[:student] == 'Murali' }
           .count { |k| k[:subject] }

# 4) Is there a girl in the class?

school_hash.any? { |i| i[:gender] == 'female' }

# 5) Find all students who have secured above 85% in any subject?

school_hash
  .find_all { |i| i[:student] && (i[:mark1].to_i + i[:mark2].to_i) / 2 >= 85 }
  .map { |i| i[:student] }
  .uniq

# 6) Have all students secured above 80% in Geography?

school_hash.all? { |x| x[:subject] == 'Geography' && (x[:mark1].to_i + x[:mark2].to_i) / 2 >= 80 }
