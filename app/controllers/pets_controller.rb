class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    @owners = Owner.all
binding.pry
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pets.create(params[:pet])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save
    #  redirect "/pets/#{@pet.id}"
    binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
binding.pry
    erb :'/pets/show'
  end

  patch '/pets/:id' do
binding.pry
@pet = Pet.find(params[:id])
   @pet.update(params[:pet])

   #binding.pry

   if !params["owner"]["name"].empty?
     @pet.owner = Owner.create(name: params["owner"]["name"])
   end

   @pet.save

    redirect to "pets/#{@pet.id}"
  end
end
