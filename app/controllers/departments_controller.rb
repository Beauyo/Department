class DepartmentsController < ApplicationController
   before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def new
    @departments = Department.new
     render partial: "form"
  end

  def show
  end

    def create
      @department = Department.new(department_params)
    
      if @department.save
      redirect_to departments_path
      else
      render :new
      end
    end
    

    def edit
      render partial: "form"
    end

    def update 
      
      if @department.update(department_params)
        redirect_to @department
      else 
        render :edit
      end
    end

    def destroy
      @departments.destroy
      redirect_to departments_path
    end

    private
    def department_params
      params.require(:department).permit(:name)
    end

    def set_department
      @departments = Department.find(params[:id])
    end

end
