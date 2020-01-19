class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  # page ou est le form a remplir
  def new
    @task = Task.new
  end

  # la ou on envoie la data du form
  def create
    @task = Task.new(task_params)

    @task.save
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
