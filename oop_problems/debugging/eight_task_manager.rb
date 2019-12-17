# Task Manager
# Valentina is using a new task manager program she wrote. When interacting
# with her task manager, an error is raised that surprises her. Can you find
# the bug and fix it?
class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

# def display_high_priority_tasks
#   tasks = tasks.select do |task|
#     task.priority == :high
#   end
#
#   display(tasks)
# end

  def display_high_priority_tasks
    high_priority_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  # def display_high_priority_tasks
  #   tasks = self.tasks.select do |task|
  #     task.priority == :high
  #   end
  #
  #   display(tasks)
  # end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

# The error we get is
# "eight_task_manager.rb:40:in `display_high_priority_tasks': private method `select' called for nil:NilClass (NoMethodError)
# from eight_task_manager.rb:81:in `<main>'"
# As written, the program uses `display_high_priority_tasks` to call #select
# which returns a new array, containing only the elements which evaluated as
# true for the given block. In the program as written, this return value is
# assigned to the local variable `tasks` and then passed into the `display`
# method as an argument. Assigning the return value to a non-ambiguous local
# variable instead seems to work.
# Alternately, reassignment of the instance variable `@tasks` also works, but
# this permanently reassigns the value of the instance variable `@tasks` to only
# the high priority tasks.

# The best solution is to prepend `self` to the tasks.select method call to
# indicate that the `display_high_priority_tasks` method should be accessing the
# `tasks` instance variable, which refers to an array and can therefore be
# used with `Array#select`. As written, `display_high_priority_tasks` is
# referring to the newly declared local variable `tasks` instead of the instance
# variable `@tasks`. That's why changing the name of the variable assignment
# works as well.
