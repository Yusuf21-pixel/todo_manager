class Todo < ActiveRecord::Base
  def to_pleasant_string
    iscompleted = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{iscompleted}"
  end
end
