class School_hash
def initialize
  @data = [
    { "id": 1, "first_name": 'Con', "gender": 'Female', "language": 35, "english": 34, "maths": 54, "science": 1,
      "social": 64 },
    { "id": 2, "first_name": 'Rebbecca', "gender": 'Female', "language": 43, "english": 90, "maths": 65, "science": 44,
      "social": 25 },
    { "id": 3, "first_name": 'Felicity', "gender": 'Female', "language": 42, "english": 59, "maths": 42, "science": 56,
      "social": 8 },
    { "id": 4, "first_name": 'Faber', "gender": 'Male', "language": 100, "english": 97, "maths": 99, "science": 73,
      "social": 79 },
    { "id": 5, "first_name": 'Serge', "gender": 'Male', "language": 50, "english": 92, "maths": 80, "science": 14,
      "social": 43 },
    { "id": 6, "first_name": 'Donall', "gender": 'Male', "language": 100, "english": 72, "maths": 68, "science": 51,
      "social": 99 },
    { "id": 7, "first_name": 'Wood', "gender": 'Male', "language": 28, "english": 64, "maths": 84, "science": 49,
      "social": 96 },
    { "id": 8, "first_name": 'Tommie', "gender": 'Male', "language": 65, "english": 89, "maths": 31, "science": 8,
      "social": 14 },
    { "id": 9, "first_name": 'Helaina', "gender": 'Female', "language": 82, "english": 7, "maths": 93, "science": 29,
      "social": 13 },
    { "id": 10, "first_name": 'Vaughn', "gender": 'Male', "language": 44, "english": 73, "maths": 88, "science": 17,
      "social": 61 },
    { "id": 11, "first_name": 'Burgess', "gender": 'Male', "language": 57, "english": 96, "maths": 56, "science": 13,
      "social": 52 },
    { "id": 12, "first_name": 'Miof mela', "gender": 'Female', "language": 64, "english": 37, "maths": 59, "science": 79,
      "social": 81 },
    { "id": 13, "first_name": 'Sheila', "gender": 'Female', "language": 93, "english": 45, "maths": 7, "science": 52,
      "social": 32 },
    { "id": 14, "first_name": 'Modestia', "gender": 'Female', "language": 50, "english": 70, "maths": 49,
      "science": 3, "social": 94 },
    { "id": 15, "first_name": 'Kile', "gender": 'Male', "language": 49, "english": 43, "maths": 30, "science": 57,
      "social": 33 },
    { "id": 16, "first_name": 'Ozzie', "gender": 'Male', "language": 61, "english": 22, "maths": 72, "science": 51,
      "social": 78 },
    { "id": 17, "first_name": 'Stephenie', "gender": 'Female', "language": 81, "english": 21, "maths": 76, "science": 7,
      "social": 98 },
    { "id": 18, "first_name": 'Merrielle', "gender": 'Female', "language": 87, "english": 46, "maths": 49, "science": 63,
      "social": 65 },
    { "id": 19, "first_name": 'Rodger', "gender": 'Male', "language": 60, "english": 6, "maths": 21, "science": 33,
      "social": 4 },
    { "id": 20, "first_name": 'Flint', "gender": 'Male', "language": 10, "english": 67, "maths": 89, "science": 74,
      "social": 6 },
    { "id": 21, "first_name": 'Ardisj', "gender": 'Female', "language": 14, "english": 30, "maths": 66,
      "science": 23, "social": 51 },
    { "id": 22, "first_name": 'Ilaire', "gender": 'Male', "language": 29, "english": 44, "maths": 86, "science": 32,
      "social": 96 }
  ]
end

# 1
def name_list(name)
  @data.map { |i| i[name] }
end

# 2
def gender_count(gender)
  @data.count { |i| i[:gender] == gender }
end

# 3
def student_highest_mark_in_sub(subject)
  @data.max_by { |i| i[subject] }[:first_name]
end

# 4
def id_and_total_marks
  @data
    .map { |i| [i[:id], i.values_at(:language, :english, :maths, :science, :social).sum] }
    .to_h
end

# 5
def count_students_by_gender
  @data
    .group_by { |i| i[:gender] }
    .map { |k, v| [k, v.count] }
    .to_h
end

# 6
def count_failed_students_by_subject(subject)
  @data.count { |i| i[subject] < 35 }
end

# 7
def all_subjects_pass_count
  @data.count do |i|
    i[:english] >= 35 && i[:language] >= 35 && i[:maths] >= 35 && i[:science] >= 35 && i[:social] >= 35
  end
end

# 8
def add_extra_properties
  updated_data = @data
                 .map do |student|
    total_marks = student.values_at(:language, :english, :maths, :science, :social).sum
    pass = student.values_at(:language, :english, :maths, :science, :social).all? { |x| x > 35 }
    student.merge('total_marks' => total_marks, 'pass' => pass)
  end
  passed_student_data = updated_data
                        .filter { |e| e['pass'] == true }.sort_by { |student| student[:total_marks] }
                        .each_with_index { |student, index| student['rank'] = index }

  updated_data.map do |student|
    rank = student['pass'] ? passed_student_data.find_index(student) + 1 : nil
    student.merge('rank' => rank)
  end
end

# 9
def students_scored_full_marks(subject)
  @data.any? { |i| i[subject] == 100 }
end

# 10
def check_all_students_passed(subject)
  @data.all? { |i| i[subject] >= 35 }
end

# 11
def find_student_record(id)
  @data.find { |i| i[:id] == id }
end

# 12
def student_record_scored_high_marks(subject)
  @data.max_by { |i| i[subject] }
end

# 13
def student_count_scored_below_40(subject)
  @data.count { |i| i[subject] < 40 }
end

# 14
def student_list_passed_both_subjects(subject1, subject2)
  @data.select { |i| i[subject1] >= 35 && i[subject2] >= 35 }
end

# 15
def highest_total_mark_student
  updated_data = @data
                 .map do |student|
    total_marks = student.values_at(:language, :english, :maths, :science, :social).sum
    student.merge('total_marks' => total_marks)
  end
  updated_data.max_by { |i| i['total_marks'] }[:first_name]
end

# 16
def average_marks_for_subject
  average_marks = {}
  %i[language english maths science social].each do |subject|
    values = @data.map { |i| i[subject] }
    average_marks[subject] = values.sum / @data.length
  end
  puts average_marks
end

# 17
def passed_students_list_except_social
  @data.select { |i| i[:english] >= 35 && i[:language] >= 35 && i[:maths] >= 35 && i[:science] >= 35 }
end

# 18
def highest_total_marks_student_name(gender)
  updated_data = @data
                 .map do |student|
    total_marks = student.values_at(:language, :english, :maths, :science, :social).sum
    student.merge('total_marks' => total_marks)
  end
  updated_data
    .filter { |i| i[:gender] == gender }
    .max_by { |i| i['total_marks'] }
end

# 19
def male_name_list_failed_in_two_subjects
  list = @data.select do |i|
    i[:gender] == 'Male' &&
      i.values_at(:language, :english, :maths, :science, :social)
       .count { |subject| subject < 35 } >= 2
  end
  list.map { |student| student[:first_name] }
end

# 20
def average_marks_for_subject_by_gender(gender)
  gender_data = @data.select { |i| i[:gender] == gender }
  average_marks = {}
  %i[language english maths science social].each do |subject|
    values = gender_data.map { |i| i[subject] }
    average_marks[subject] = values.sum / gender_data.length
  end
  puts average_marks
end

# 21
def highest_total_mark_student_list
  updated_data = @data
                 .map do |student|
    total_marks = student.values_at(:language, :english, :maths, :science, :social).sum
    student.merge('total_marks' => total_marks)
  end
  updated_data.filter { |student| student[:gender] == 'Male' }
              .sort_by { |student| student['total_marks'] }
              .reverse
              .take(5)
end

# 22
def passed_students_list_except_science(gender)
  @data.select do |i|
    i[:gender] == gender &&
      i.values_at(:english, :language, :maths, :social).all? { |sub| sub > 35 } &&
      i[:science] < 35
  end
end

# 23
def pass_percentage_student_atleast_three_subject
  list = @data.select do |i|
    i
      .values_at(:language, :english, :maths, :science, :social)
      .count { |subject| subject >= 35 } >= 3
  end
  list.map { |x| x.values_at(:language, :english, :maths, :science, :social).sum }
      .map { |m| (m * 100) / 500 }
end
# end
school_hash = School_hash.new
# 1. Get list of names of all students
school_hash.name_list(:first_name)
# 2. How many male students are there?
school_hash.gender_count('Male')
# 3. Name of the student who got the highest marks in maths
school_hash.student_highest_mark_in_sub(:maths)
# 4. List of ids and their total marks
# expected result format: { 1: 188, 2: 267, ...}
school_hash.id_and_total_marks
# 5. Count of students by gender.
# expected result format: { Male: 27, Female: 73}
school_hash.count_students_by_gender
# 6. How many students have failed in english? Pass mark is 35.
school_hash.count_failed_students_by_subject(:english)
# 7. How many students have passed in all subjects?
school_hash.all_subjects_pass_count
# 8. Add extra properties to the existing student records:
school_hash.add_extra_properties
# 9. Check if any of the students has scored 100 marks in science.
school_hash.students_scored_100marks(:science)
# 10. Check if all students have passed in maths.
school_hash.check_all_students_passed(:maths)
# 11. Find the student record whose id is 96.
school_hash.find_student_record(96)
# 12. Find the student record who has scored the most in maths.
school_hash.student_record_scored_high_marks(:maths)
# 13.How many students have scored below 40 in language?
school_hash.student_count_scored_below_40(:language)
# 14.List the students who have passed in both English and Math (pass mark is 35 for both).
school_hash.student_list_passed_both_subjects(:english, :maths)
# 15.Find the student with the highest total marks.
school_hash.highest_total_mark_student
# 16.Calculate the average marks for each subject (language, english, maths, science, social).
school_hash.average_marks_for_subject
# 17.List the students who have passed all subjects except social (pass mark is 35 for each subject).
school_hash.passed_students_list_except_social
# 18.Find the student who has the highest total marks among female students.
school_hash.highest_total_marks_student_name('Female')
# 19.List the male students who have failed in at least two subjects
school_hash.male_name_list_failed_in_two_subjects
# 20.Calculate the average marks for each subject (language, english, maths, science, social) for female students.
school_hash.average_marks_for_subject_by_gender('Female')
# 21.Find the top 5 male students with the highest total marks.
school_hash.highest_total_mark_student_list
# 22.List the female students who have failed in science but passed in all other subjects
school_hash.passed_students_list_except_science('Female')
# 23.Calculate the percentage of students who have passed in at least three subjects.
school_hash.pass_percentage_student_atleast_three_subject