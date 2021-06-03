class Todo < ActiveRecord::Base
  belongs_to :user
  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.mark_as_complete!(todo_id)
    # find_by returns the object if a record is present with the given id otherwise It will return nil.
    todo = find_by(id: todo_id)
    if todo.nil?
      puts "Invalid id #{todo_id} does not exist..."
      exit
    else
      todo.completed = true
      todo.save
      todo
    end
  end
end
