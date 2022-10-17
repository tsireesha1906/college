class StudentController < ApplicationController
	def index
		@students = Student.all
	end
	def new
		@student = Student.new
	end

	def create
	@student =Student.new(student_params)
	if @student.save
		flash[:notice]= 'saved'
		redirect_to student_index_path
	else
		flash[:notice] = 'not saved'
		render :new
	end


	end

	def edit
		@student =Student.find_by_id(params[:id])

	end

	def update
		@student =Student.find_by_id(params[:id])
		if @student.update(student_params)
			flash[:notice]= 'updated'
			redirect_to student_index_path
		else
			flash[:notice] = 'not updated'
			render :edit
		end
	end

	def delete
		ff
	end

	private

	def student_params
		params.require(:student).permit(:name,:address)
	end
	

end
