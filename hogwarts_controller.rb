require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("models/student")
also_reload("models")

# INDEX
get '/hogwarts' do
  @students = Student.all
  erb(:index)
end
