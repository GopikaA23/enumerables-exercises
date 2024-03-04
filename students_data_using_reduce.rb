# data = [
#   { "id": 1, "first_name": 'Con', "gender": 'Female', "language": 35, "english": 34, "maths": 54, "science": 1,
#     "social": 64 },
#   { "id": 2, "first_name": 'Rebbecca', "gender": 'Female', "language": 43, "english": 90, "maths": 65, "science": 44,
#     "social": 25 },
#   { "id": 3, "first_name": 'Felicity', "gender": 'Female', "language": 42, "english": 59, "maths": 42, "science": 56,
#     "social": 8 },
#   { "id": 4, "first_name": 'Faber', "gender": 'Male', "language": 100, "english": 97, "maths": 99, "science": 73,
#     "social": 79 },
#   { "id": 5, "first_name": 'Serge', "gender": 'Male', "language": 50, "english": 92, "maths": 80, "science": 14,
#     "social": 43 },
#   { "id": 6, "first_name": 'Donall', "gender": 'Male', "language": 100, "english": 72, "maths": 68, "science": 51,
#     "social": 99 },
#   { "id": 7, "first_name": 'Wood', "gender": 'Male', "language": 28, "english": 64, "maths": 84, "science": 49,
#     "social": 96 },
#   { "id": 8, "first_name": 'Tommie', "gender": 'Male', "language": 65, "english": 89, "maths": 31, "science": 8,
#     "social": 14 },
#   { "id": 9, "first_name": 'Helaina', "gender": 'Female', "language": 82, "english": 7, "maths": 93, "science": 29,
#     "social": 13 },
#   { "id": 10, "first_name": 'Vaughn', "gender": 'Male', "language": 44, "english": 73, "maths": 88, "science": 17,
#     "social": 61 },
#   { "id": 11, "first_name": 'Burgess', "gender": 'Male', "language": 57, "english": 96, "maths": 56, "science": 13,
#     "social": 52 },
#   { "id": 12, "first_name": 'Miof mela', "gender": 'Female', "language": 64, "english": 37, "maths": 59, "science": 79,
#     "social": 81 },
#   { "id": 13, "first_name": 'Sheila', "gender": 'Female', "language": 93, "english": 45, "maths": 7, "science": 52,
#     "social": 32 },
#   { "id": 14, "first_name": 'Modestia', "gender": 'Female', "language": 50, "english": 70, "maths": 49,
#     "science": 3, "social": 94 },
#   { "id": 15, "first_name": 'Kile', "gender": 'Male', "language": 49, "english": 43, "maths": 30, "science": 57,
#     "social": 33 },
#   { "id": 16, "first_name": 'Ozzie', "gender": 'Male', "language": 61, "english": 22, "maths": 72, "science": 51,
#     "social": 78 },
#   { "id": 17, "first_name": 'Stephenie', "gender": 'Female', "language": 81, "english": 21, "maths": 76, "science": 7,
#     "social": 98 },
#   { "id": 18, "first_name": 'Merrielle', "gender": 'Female', "language": 87, "english": 46, "maths": 49, "science": 63,
#     "social": 65 },
#   { "id": 19, "first_name": 'Rodger', "gender": 'Male', "language": 60, "english": 6, "maths": 21, "science": 33,
#     "social": 4 },
#   { "id": 20, "first_name": 'Flint', "gender": 'Male', "language": 10, "english": 67, "maths": 89, "science": 74,
#     "social": 6 },
#   { "id": 21, "first_name": 'Ardisj', "gender": 'Female', "language": 14, "english": 30, "maths": 66,
#     "science": 23, "social": 51 },
#   { "id": 22, "first_name": 'Ilaire', "gender": 'Male', "language": 29, "english": 44, "maths": 86, "science": 32,
#     "social": 96 }
# ]

# 1
def name_list(data)
  data.reduce([]) { |list, student| list << student[:first_name] }
end

# 2
def gender_count(data)
  data.reduce(0) do |gender_count, student|
    student[:gender] == 'Female' && gender_count += 1
    gender_count
  end
end

# 3
# def student_highest_mark_in_sub(data)
#   data.reduce() do |student,record|
#     if record[:maths]
# end

# 4
def id_and_total_marks(data)
  data.reduce([]) do |result, student|
    result << { student[:id] => student.values_at(:language, :english, :maths, :science, :social).sum }
  end
end

# 5
def count_students_by_gender(data)
  data.each_with_object(Hash.new(0)) do |student, count|
    count[student[:gender]] += 1
  end
end

# 6
def count_failed_students_by_english(data)
  data.reduce(0) do |pass_count, student|
    student[:english] < 35 && pass_count += 1
    pass_count
  end
end

# 7
def all_subjects_pass_count(data)
  data.reduce(0) do |all_pass_count, student|
    student[:language] >= 35 && student[:english] >= 35 && student[:maths] >= 35 && student[:science] >= 35 && student[:social] >= 35 && all_pass_count += 1
    all_pass_count
  end
end

# 9
def students_scored_100marks_science(data)
  data.reduce { |_result, student| student[:science].any? { |mark| mark == 100 } }
end

# 10
def check_all_students_passed(data)
  data.reduce { |_result, student| student[:maths] >= 35 }
end
