class TasksController < ApplicationController
    before_action :set_task, only: [:edit,:destroy]
    def index
        @tasksToday = Task.todays_tasks.users_tasks(current_user).page(params[:page]).per(9)
        new()
    end
    def report
        @tasks = Task.all
        
        @date1, @date2 = Task.check_values(task_report_params[:date1],task_report_params[:date2])
        @tasksByUser = @tasks.users_tasks(task_report_params[:selected_user])
        @tasksBetween = @tasks.tasks_between_dates(@date1, @date2).users_tasks(task_report_params[:selected_user])
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
            redirect_to tasks_path , notice:"Kayıt Oluşturuldu!"
        else
            render :new
        end
    end
    def update
        @task = set_task
        
        if @task.update(task_params)
            redirect_to tasks_path, notice: 'Kayıt Güncellendi!.'
        else
            render :edit
        end
    end    
    def destroy
        if @task.destroy
            redirect_to tasks_path , notice:"Kayıt Silindi!"
        end
    end
    private
        def set_task
            @task = Task.find(params[:id])
        end
        def task_params
            params.require(:task).permit(:comment,:date,:start_time,:end_time)
        end
        def task_report_params
            params.fetch(:task_report, {}).permit(:date1, :date2, :selected_user)
        end
            
end
