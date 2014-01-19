class Admin::PagesController < ApplicationController
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to admin_pages_url, notice: 'Страница добавлена'
    else
      render :new, notice: 'Не удалось добавить страницу'
    end
  end
end
