class Student

  attr_reader :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    return if courses.include?(course)
    raise "Course conflict error" if has_conflict?(course)

    unless @courses.include?(course)
      @courses << course
      course.students << self
    end
  end

  def has_conflict?(c2)
    # truthiness = false
    self.courses.any? do |c1|
      c2.conflicts_with?(c1)
    end
    # return truthiness
  end

  def course_load
    course_load = {}
    @courses.each do |course|
      if course_load.has_key?(course.department)
        course_load[course.department] += course.credits
      else
        course_load[course.department] = course.credits
      end
    end
    course_load
  end

end
