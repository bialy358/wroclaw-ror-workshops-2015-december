class StudentDecorator < BaseDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    student_note = SubjectItemNote.where(subject_item_id: subject_item.id, student_id: subject_item.student_id)
    if student_note.nil?
      0
    else
      student_note.average(:value)
    end
  end
end



