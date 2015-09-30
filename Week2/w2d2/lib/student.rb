class Student

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def courses
    @courses
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(course)
    @courses << course unless @courses.include?(course)
  end

  def course_load
    course_load = {}
    @courses.each do |course|
      if course_load.include_key?(course.department)
        course_load[course.department] += course.credits
      else
        course_load[course.department] = course.credits
      end
    end
    course_load
  end

end
