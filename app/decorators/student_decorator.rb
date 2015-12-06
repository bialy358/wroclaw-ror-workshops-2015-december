class StudentDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper
  def full_name
    "#{first_name} #{last_name}"
  end

  def borndate
    if birthdate.present?
    birthdate.strftime("%Y-%m_%d")
    else
      "-"
    end
  end
  def avg_notes(subject_item)

    student_avg_note = subject_item_notes.where(subject_item_id: subject_item)
    if student_avg_note.empty?
      "0.00"
    else
      number_with_precision(student_avg_note.average(:value), precision: 2)
    end
  end
end