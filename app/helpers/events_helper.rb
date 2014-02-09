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
  
  def schedule(&block)
    Schedule.new(self,block).table
  end
  
  class Schedule < Struct.new(:view, :callback)
    HEADER = [' ','понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота', 'воскресенье']
    START_DAY = :monday
    START_TIME = TimeOfDay.new(8)
    PERIODS = 30
    
    delegate :content_tag, to: :view
    
    def table
      content_tag :table, class: "schedule" do
        header + time_rows
      end
    end
    
    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end
    
    def time_rows
      time_periods.map do |time_period|
        content_tag :tr do
          [(content_tag :td, time_period[:name], class: "time-header")].concat((1..7).map { |day| period_cell(day,time_period[:start]) }).join.html_safe
        end
      end.join.html_safe
    end
    
    def period_cell(day,start)
      content_tag :td, "", class: "period", id: "period-#{day}-#{start}"
    end
    
    def time_periods
      (0..PERIODS).map { |offset| { name: period_name(START_TIME.second_of_day/60 + offset*30), start: period_start(START_TIME.second_of_day/60 + offset*30) } }
    end
    
    def period_name(minutes)
      (TimeOfDay.new(0) + minutes*60).strftime("%H:%M")
    end
    
    def period_start(minutes)
      minutes
    end
  end
end
