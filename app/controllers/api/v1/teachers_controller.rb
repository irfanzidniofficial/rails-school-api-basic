module Api 
    module V1

        class TeachersController < ApplicationController
            def index 
            @teachers = Teacher.all
            render json: @teachers
            end

            def show
                @teacher = Teacher.find(params[:id])
                render json: @teacher
            end

            def update
                @teacher = Teacher.find(params[:id])
                if @teacher.update(teacher_params)
                    render json: @teacher
                else
                    render json: @teacher.errors, status: unprocessable_entity
                end

            end

            def destroy
                @teacher = Teacher.find(params[:id])
                if @teacher.present?
                    @teacher.destroy
                    render json: @teacher
                else
                    render jsoon: {error: 'Teacher not found'}
                end
            end

            def create
                @teacher = Teacher.new(teacher_params) 

                if @teacher.save
                    render json: @teacher
                else
                    render json: @teacher.errors, status: unprocessable_entity
                end
            end

            private
            def teacher_params
                params.require(:teacher).permit(:name, :address)
            end

          

          
        end
    end
end

