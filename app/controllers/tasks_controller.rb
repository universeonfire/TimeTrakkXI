class TasksController < ApplicationController
    before_action :set_task, only: [:edit,:destroy]
    def index
        @tasks = Task.all
        @tasksByUser = @tasks.users_tasks(current_user.id)
        new()
    end
    def report
        @tasks = Task.all
        @date1, @date2 = Task.check_values(task_report_params[:date1],task_report_params[:date2])
        @tasksByUser = @tasks.users_tasks(task_report_params[:selected_user])
        @tasksBetween = @tasks.tasks_by_time.tasks_between_dates(@date1, @date2).users_tasks(task_report_params[:selected_user]).page(params[:page]).per(20)
        respond_to do |format|
            format.html
            format.js
        end
    end
    def new
        @task = Task.new
        respond_to do |format|
            format.html
            format.js
        end
    end
    def create
        @task = Task.new(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to tasks_path , notice:"Saved!"
        else
            render :new
        end
    end
    def update
        @task = set_task
        
        if @task.update(task_params)
            redirect_to tasks_path, notice: 'Updated!'
        else
            render :edit
        end
    end    
    def destroy
        if @task.destroy
            redirect_to tasks_path , notice:"Destroyed!"
        end
    end
    private
        def set_task
            @task = Task.find(params[:id])
        end
        def task_params
            params.require(:task).permit(:comment,:task_type,:start_time,:time_to_start,:time_to_end)
        end
        def task_report_params
            params.fetch(:task_report, {}).permit(:date1, :date2, :selected_user)
        end
            
end
