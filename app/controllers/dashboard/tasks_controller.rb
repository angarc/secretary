class Dashboard::TasksController < Dashboard::BaseController
  def index
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.extract_duration_hours_and_minutes
    @task.save 

    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.extract_duration_hours_and_minutes
    @task.save 
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline, :duration, :description)
  end
end
