class Api::TodosController < ApplicationController
  before_action :set_todo, only: %i[ show update_completed destroy ]

  # GET /todos
  def index
  puts "✔️  INDEX HIT — format: #{request.format}" 

  @todos = Todo.all

  render json: {
    message: "It works!",
    count: @todos.count,
    todos: @todos
  }
end


  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def update_completed
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy!
  end

  private

  def set_todo
  @todo = Todo.find_by(id: params[:id])
  render json: { error: "Todo not found" }, status: :not_found if @todo.nil?
end


  def todo_params
    params.require(:todo).permit(:todo_name, :completed)
  end

end
