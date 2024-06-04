module Api 
    module V1

        class TeachersController < ApplicationController
            def index 
            @teachers = Teacher.all
            render json: @teachers
            end

            def show
            end

          
        end
    end
end

