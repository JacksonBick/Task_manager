class Api::V1::TasksController < ApplicationController
  # def index
  #   render json: {
  #     example_key: {
  #       example_nested_key: "It worked!"
  #     },
  #     example_array_key: [
  #       "Array item 1", "Array item 2"
  #     ]
  #   }
  # end
  # def index
  #   render json: Task.all
  # end
  def index
    render json: Task.all
  end

  def show

  end
  def show
    #binding.pry
    render json: Task.find(params[:id])
  end
  def create
    #binding.pry
    render json: Task.create(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
  def update
    render json: Task.update(params[:id], task_params)
  end
  def destroy
    render json: Task.delete(params[:id])
  end
  def index
    tasks = Task.all
    render json: TaskSerializer.format_tasks(tasks)
  end
end