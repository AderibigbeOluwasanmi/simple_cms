class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted

  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => 'Default')
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save then
      flash[:notice] = 'Subject created successfully'
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params) then
      flash[:notice] = 'Subject destroyed successfully'
      redirect_to(subject_path(@subject.id))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject #{@subject.name} destroyed successfully"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :visible, :position)
  end
end
