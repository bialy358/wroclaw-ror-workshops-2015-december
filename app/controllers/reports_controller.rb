class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:subject_item)
  expose(:subject_item_students) { subject_item.students }

  def subjects

  end

end
