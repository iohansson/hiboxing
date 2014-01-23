include EventsHelper

class Admin::EventsController < Admin::ApplicationController
  before_filter :authorize

  def index
    @events = Event.all
    @groups = Group.all
  end
  
  def update
    @event = Event.find(params[:id])
    event = params_to_event(params[:event])
    if @event.update_attributes(event)
      respond_to do |format|
        format.json { render json: {
          id: '#'+@event.js_id 
        }, status: 200 }
      end
    else
      respond_to do |format|
        format.json { render json: { }, status: :unprocessable_entity }
      end
    end
  end
  
  def create
    if request.xhr?
      event = params_to_event(params[:event])
      @event = Event.new(event)
      if @event.save
        respond_to do |format|
          format.json { render json: {
            id: '#'+@event.js_id 
          }, status: 200 }
        end
      else
        respond_to do |format|
          format.json { render json: { }, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def destroy
    if request.xhr?
      @event = Event.find(params[:id])
      if @event.destroy
        respond_to do |format|
          format.json { render json: {}, status: 200}
        end
      else
        respond_to do |format|
          format.json { render json: {}, status: :unprocessable_entity }
        end
      end
    end
  end
end
