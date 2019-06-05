require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("models/student")
require_relative("models/house")
also_reload("models")

# INDEX
get "/hogwarts" do
  @students = Student.all
  erb(:index)
end

# NEW
get "/hogwarts/new" do
  @houses = House.all
  erb(:new)
end

# CREATE
post "/hogwarts" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

# SHOW
get "/hogwarts/:id" do
  @student = Student.find(params[:id].to_i)
  erb(:show)
end

# EDIT
get "/hogwarts/:id/edit" do
  @houses = House.all
  @student = Student.find(params[:id].to_i)
  erb(:edit)
end

# UPDATE
post "/hogwarts/:id" do
  student = Student.new(params)
  student.update
  redirect to("/hogwarts")
end

# DELETE
post "/hogwarts/:id/delete" do
  student = Student.find(params[:id].to_i)
  student.delete
  redirect to ("/hogwarts")
end
