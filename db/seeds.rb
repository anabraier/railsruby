# db/seeds.rb

Todo.destroy_all

todos = [
  { todo_name: "Finish API", complete: false },
  { todo_name: "Drink coffee", complete: true },
  { todo_name: "Test1", complete: false }
]

todos.each do |todo|
  Todo.create!(todo)
end

puts "✅ Seeded #{Todo.count} todos!"
