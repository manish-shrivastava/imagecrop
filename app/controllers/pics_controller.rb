class PicsController < ApplicationController
  # GET /pics
  # GET /pics.json
  def index
    @pics = Pic.all
    @pic = Pic.new
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /pics/1
  # GET /pics/1.json
  def show
    @pic = Pic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pic }
    end
  end

  # GET /pics/new
  # GET /pics/new.json
  def new
    @pic = Pic.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /pics/1/edit
  def edit
    @pic = Pic.find(params[:id])
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = Pic.new(params[:pic])
    @pics = Pic.all
    respond_to do |format|
      if @pic.save
          format.js
          @pic.image.reprocess!
      else
        render 'new'
      end  
    end
  end

  # PUT /pics/1
  # PUT /pics/1.json
  def update
    @pic = Pic.find(params[:id])

    respond_to do |format|
      if @pic.update_attributes(params[:pic])
        format.js
      else
        render 'edit'
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy
    @pics = Pic.all
    respond_to do |format|
      format.js
    end
  end
  
  
  
end
