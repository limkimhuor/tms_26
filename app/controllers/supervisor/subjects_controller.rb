class Supervisor::SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t(:create_succes, model: :"Subject")
      redirect_to [:supervisor, @subject]
    else
      render "new"
    end   
  end

  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def show
    @subject = Subject.find params[:id]
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes(subject_params)
      flash[:info] = t(:edit_succes, model: :"Subject")
      redirect_to [:supervisor, @subject]
    else
      render "edit"
    end
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy
    flash[:success] = t(:delete_succes, model: :"Subject")
    redirect_to supervisor_subjects_url
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description, :status , 
                                    tasks_attributes: [:id, :name, :description, 
                                                      :status, :_destroy]
  end
end
