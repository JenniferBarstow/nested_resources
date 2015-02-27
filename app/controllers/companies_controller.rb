class CompaniesController < ApplicationController

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
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end


  def update
    @company = Company.find(params[:id])
      if @company.update(company_params)
        flash[:notice] = 'Company was successfully updated'
        redirect_to companies_path
      else
        render :edit
      end
    end

    def destroy
      @company = Company.find(params[:id])
      if @lightsaber.destroy
        flash[:notice] = "Company was destroyed"
        redirect_to companies_path
      end
    end

  private
  def company_params
    params.require(:company).permit(:name)
  end
end
