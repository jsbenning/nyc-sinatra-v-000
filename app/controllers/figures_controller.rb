class FiguresController < ApplicationController
require 'pry'
  get '/figures' do
    erb :'/figures/index'
    
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if (params[:landmark])
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure_id = @figure.id
      @figure.landmarks << @landmark
      @figure.save
      @landmark.save
    end

    if (params["title"]["name"])
      @title = Title.create(params[:title])
      @ft = FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
      
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show" 
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
        if !(params[:landmark]).empty?
      @landmark = Landmark.create(params[:landmark])
      @landmark.figure_id = @figure.id
      @figure.landmarks << @landmark
      @landmark.save
    end
    if !(params["title"]["name"]).empty?
      @title = Title.create(params[:title])
      @ft = FigureTitle.create(title_id: @title.id, figure_id: @figure.id)
    end
    redirect to "/figures/#{@figure.id}"
  end



end