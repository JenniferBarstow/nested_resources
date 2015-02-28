class CompaniesController < ApplicationController

  before_action :set_company, only: [:show, :edit, :update]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = "Your company was successfully created!"
      redirect_to @events
    else
      render :new
    end
  end

  def show

  end

  def edit

  end


  def update

      if @company.update(company_params)
        flash[:notice] = 'Company was successfully updated'
        redirect_to companies_path
      else
        render :edit
      end
    end

    def destroy
      @company = Company.find(params[:id])
      if @company.destroy
        flash[:notice] = "Company was destroyed"
        redirect_to companies_path
      end
    end

  private
  def company_params
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end

end
