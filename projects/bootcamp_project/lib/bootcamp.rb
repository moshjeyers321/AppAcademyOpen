class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(string)
    @teachers << string
  end

  def enroll (string)
    if @students.length < @student_capacity
        @students << string
        true
    else
        false
    end
  end

  def enrolled?(string)
    @students.include?(string)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade
        true
    else
        false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    return nil if @grades[student].length == 0 || !enrolled?(student)
    @grades[student].sum / @grades[student].length
  end
end
