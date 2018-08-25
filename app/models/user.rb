class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
    # enrolled_courses = []
    # enrollments.each do |enrollment|
    #   enrolled_courses << enrollment.course
    # end
## REFACTORING ABOVE CODE ##
    # enrolled_courses = enrollments.collect do |enrollment|
    #   enrollment.course
    # end
## REFACTORING ABOVE CODE AGAIN!##
    # enrolled_courses = enrollments.collect(&:course)
## USING "has_many, through: GIVES BELOW LINE ONLY##

    return enrolled_courses.include?(course)
  end

end
