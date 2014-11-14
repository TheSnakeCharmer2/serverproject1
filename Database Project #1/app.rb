require 'sinatra'
require 'sequel'


DB = Sequel.connect("sqlite://test.db")

get '/create_table' do
DB.create_table(:stuff) do
  primary_key(:id)
  String(:name)
  String(:comment)
  end
end

post '/print' do
  @user = params['username']
  @comment = params['comment']
  @items = DB[:stuff]
  @items.insert(:name => @user,:comment => @comment )

  erb :data
end