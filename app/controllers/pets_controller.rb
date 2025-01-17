class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    @owners = Owner.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @owners = Owner.all
    @pet = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save
    #  redirect "/pets/#{@pet.id}"
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    # @owners = Owner.all
    @pet = Pet.find(params[:id])
# binding.pry
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
   @owners = Owner.all
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
