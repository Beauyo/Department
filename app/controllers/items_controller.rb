class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

    if @items.update(items_params)
        redirect_to @items
    else
        render :edit
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
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end
end
