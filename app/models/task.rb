class Task < ApplicationRecord
    belongs_to :user
    
    validates_presence_of :comment, :start_time, :time_to_start, :time_to_end
    validate :time_check

    scope :tasks_by_time, -> {order(start_time: :asc,time_to_start: :asc)}
    scope :users_tasks, -> (user) { where(:user => user)}
    scope :todays_tasks, -> { where(:start_time => Date.today)}
    scope :tasks_between_dates, -> (date1, date2) { where( "start_time >= ? AND start_time <= ?", date1, date2 )}
    
     
    private
     
    def time_check
        if !(self.time_to_start < self.time_to_end)
            errors.add("Something wrong!!")
        end
    end
    def self.check_values(date1,date2)
        
        date1 = date1 != "" ? date1 : "01/01/2020"
        date2 = date2 != "" ? date2 : "31/01/2020"
        return date1, date2
    end
end
