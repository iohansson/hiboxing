module EventsHelper
  def params_to_event(params)
    {
      start: TimeOfDay.new(0)+params[:start].to_i*60,
      stop: TimeOfDay.new(0)+params[:start].to_i*60+params[:duration].to_i*60,
      day: params[:day],
      group_id: params[:group_id]
    }
  end
  
  def time(minutes)
    (TimeOfDay.new(0) +minutes*60).strftime("%H:%M") 
  end
end
