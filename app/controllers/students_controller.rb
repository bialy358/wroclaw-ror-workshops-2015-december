class StudentsController < ApplicationController

  expose(:student)
  expose(:student_subject_items) { student.subject_items }

  def index
  end

  def show
  end

  def new
  end

  def create
    if student.save
      flash[:notice] = "Student has been created!"
      redirect_to student_path(student), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.updated', resource: 'Student')
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end
end
