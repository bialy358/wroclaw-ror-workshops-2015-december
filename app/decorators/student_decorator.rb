class StudentDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper
  def full_name
    "#{first_name} #{last_name}"
  end

  def borndate(student)
    if student.birthdate.present?
    student.birthdate.strftime("%Y-%m_%d")
    else
      "-"
    end
  end
  def avg_notes(subject_item)

    student_note = SubjectItemNote.where(subject_item_id: subject_item.id, student_id: student)
    if student_note.empty?
      "0.00"
    else
      number_with_precision(student_note.average(:value), precision: 2)
    end
  end
end