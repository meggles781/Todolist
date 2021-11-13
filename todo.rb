# Display a menu
# create a default array of hashes
# add an item to the to do list
# display all the items in the to do list
# remove an item from the to do list 
# update an item from the to do list
# add the durtion of time up in minutes from all items in to do list
# exit the program


# array = []

# hash = {}

@tasks = [
  { name: "Feed Meg the dog", status: "not done", duration:  15},
  { name: "Exercise", status: "partially done", duration: 45}
]


puts @tasks

puts @tasks[0][:duration]


# C - create
# R - read
# U - update
# D - delete

def my_menu
  puts "What would you like to do?"
  puts "1. Create a task"
  puts "2. Display tasks"
  puts "3. Update a task"
  puts "4. Delete a task"
  puts "5. Add time from tasks"
  puts "6. Exit Program"
end

def create_task
  @task = {name: "", status: "", duration: 0}
  puts "please describe your task!"
  name  = gets.strip
  @task[:name] = name
  puts "please add the status of your task"
  status = gets.strip
  @task[:status] =  status
  puts "please add the duration"
  duration = gets.strip.to_i
  @task[:duration] = duration

  # @tasks << @task
  @tasks.push(@task)
end


def display_tasks
  @tasks.each_with_index do |task, index|
    puts 
    puts "#{index+1} Name: #{task[:name]} -- Durations: #{task[:duration]}"
    puts "#{task[:status]}"
    puts "_________________________"
    puts 
  end
end


def update_task(index)
  puts "what is the updated name?"
  @tasks[index][:name] = gets.strip
  puts "what is the new status"
  @tasks[index][:status] = gets.strip
  puts "what is the new duration"
  @tasks[index][:duration] = gets.strip.to_i

end

def delete_task(index)
  @tasks.delete_at(index)
  puts "Your task has been deleted!"
  display_tasks
end


# def show_one_thing
#   puts  "#{@tasks[0][:duration]} #{@tasks[0][:name]}" 
#   end

def add_duration
  total = 0
  @tasks._with_index do |task, index|
    total += @tasks[index][:duration]
    # total = total + @tasks[index][:duration]
  end
  puts "#{total} minutes"
end 
def app
  my_menu
  @option  = gets.strip.to_i


  # if @option == 1
  #   #create a task
  # elsif @

  case @option
  when 1
    create_task
    app
  when 2
    display_tasks 
    app
  when 3
    puts "What task would you like to update?"
    display_tasks
    index = gets.strip.to_i
    update_task(index - 1)
    app 
  when 4
    puts "What task would you like to delete?"
    display_tasks
    index = gets.strip.to_i
    delete_task(index - 1)
    app
  when 5
    add_duration
    app
  when 6
    # show_one_thing
    exit
    
  else 
    puts "please type in an int from 1- 6"
    app 
  end


end


app


