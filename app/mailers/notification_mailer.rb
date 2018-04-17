class NotificationMailer < ApplicationMailer
  default from: "no-reply@flixterapp.com"

  def lesson_added(lesson)
    @course = lesson.section.course
    @course.enrollments.each do |e|
      mail(
        to: e.user.email,
        subject: "New lesson added for #{@course.title}"
        )
    end
  end
end
