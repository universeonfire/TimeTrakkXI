class Task < ApplicationRecord
    belongs_to :user
    validates_presence_of :comment, :date, :start_time, :end_time
    validate :time_check

    scope :tasks_by_time, -> {order(start_time: :asc)}
    scope :users_tasks, -> (user) { where(:user => user)}
    scope :todays_tasks, -> { where(:date => Date.today)}
    scope :tasks_between_dates, -> (date1, date2) { where( "date >= ? AND date <= ?", date1, date2 )}
    
    private
    def time_check
        if !(self.start_time < self.end_time)
            errors.add("Something wrong!!")
        end
    end
    def self.find_users(tasks)
        user_arr = []
        tasks.each do |task|
            user_arr.append(task.user_id)
        end
        return user_arr.uniq
    end
    def self.check_values(date1,date2)
        date1 = date1 != "" ? date1 : "01/01/2020"
        date2 = date2 != "" ? date2 : "31/01/2020"
        return date1, date2
    end
end
