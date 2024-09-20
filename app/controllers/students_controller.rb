class StudentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_student, only: [:edit, :update, :destroy]
  
    def index
      @students = Student.all
    end
  
    def new
      @student = Student.new
    end
  
    def create
      existing_student = Student.find_by(student_name: student_params[:student_name], subject_name: student_params[:subject_name])
      if existing_student
        if existing_student.update(mark: student_params[:mark])
          redirect_to students_path, notice: 'Marks successfully updated for the student.'
        else
          redirect_to students_path, alert: 'Failed to update marks.'
        end
      else
        @student = Student.new(student_params)
        if @student.save
          redirect_to students_path, notice: 'Student was successfully added.'
        else
          render :new
        end
      end
    end
    
    def show
        @student = Student.find(params[:id])
    end    
    
    def edit
    end
  
    def update
      if @student.update(student_params)
        redirect_to students_path, notice: "Student details were successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @student.destroy
      redirect_to students_path, notice: "Student was successfully deleted."
    end
  
    private
  
    def set_student
      @student = Student.find(params[:id])
    end
  
    def student_params
      params.require(:student).permit(:student_name, :subject_name, :mark)
    end
  end
  