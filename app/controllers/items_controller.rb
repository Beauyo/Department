class ItemsController < ApplicationController
  def index
    @items = @department.items
  end

  def show
  end

  def new
    @item = @department.items.new
    render partial: "form"
  end

  def create
    @item = Department.items.new(topics_params)
  
    if @item.save
      redirect_to department_item_path(@department, @item)
    else
      render partial: "form"
    end
  end
    def edit
      render partial: "form"
    end

    def update
      if @department.update(department_params)
        redirect_to @department
      else
        render edit:
      end
    end

    def destroy
     @item.destroy
     redirect_to department_items_path(@department)

    end

    private
    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_item
      @item = Item.new(params[:id])
    end

    def item_params
      params.require(:topic).permit(:name, :body, :department_id)
    end
end
