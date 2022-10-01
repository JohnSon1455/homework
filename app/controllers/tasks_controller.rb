class TasksController < ApplicationController
	before_action :check_login!
    before_action :find_user_task, only: [:create, :destroy]

    def index
        @pending_tasks = current_user.tasks.get_by_status("Pending")
        @completed_tasks = current_user.tasks.get_by_status("Completed")
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.create(post_params(:name, :description, :bucket_id))
        @task.status = "Pending"
        @task.save
        @task.bucket.update_status
        redirect_to task_path(@task)
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(post_params(:name, :description, :status, :bucket_id))
        @bucket = @task.bucket.update_status
        redirect_to task_path(@task)
    end

    def destroy
        @task = Task.find(params[:id]).destroy
        redirect_to tasks_path
    end

    private
    def post_params(*args)
        params.require(:task).permit(*args).merge(user_id: current_user.id)
    end

    def find_user_task
		@task = current_user.tasks.find(params[:id])
	end
end
