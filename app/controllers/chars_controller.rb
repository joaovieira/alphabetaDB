class CharsController < ApplicationController
  # GET /chars
  # GET /chars.json
  def index
    @chars = Char.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chars }
    end
  end

  # GET /chars/1
  # GET /chars/1.json
  def show
    @char = Char.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @char }
    end
  end

  # GET /chars/new
  # GET /chars/new.json
  def new
    @char = Char.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @char }
    end
  end

  # GET /chars/1/edit
  def edit
    @char = Char.find(params[:id])
  end

  # POST /chars
  # POST /chars.json
  def create
    @char = Char.new(:name => params[:char][:name])
    @char.script = Script.find_by_id(params[:char][:script])
    @char.sound = Sound.new

    respond_to do |format|
      if @char.save
        format.html { redirect_to @char, notice: 'Char was successfully created.' }
        format.json { render json: @char, status: :created, location: @char }
      else
        format.html { render action: "new" }
        format.json { render json: @char.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chars/1
  # PUT /chars/1.json
  def update
    @char = Char.find(params[:id])

    respond_to do |format|
      if @char.update_attributes(params[:char])
        format.html { redirect_to @char, notice: 'Char was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @char.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chars/1
  # DELETE /chars/1.json
  def destroy
    @char = Char.find(params[:id])
    @char.destroy

    respond_to do |format|
      format.html { redirect_to chars_url }
      format.json { head :ok }
    end
  end
end
