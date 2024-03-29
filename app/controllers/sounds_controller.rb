class SoundsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!, :only => [:edit, :new, :create, :update, :destroy]

  # GET /sounds
  # GET /sounds.json
  def index
    add_breadcrumb I18n.t("sound.plural"), :sounds_path

    @sounds = Sound.order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sounds }
      format.js
    end
  end

  # GET /sounds/1
  # GET /sounds/1.json
  def show
    @sound = Sound.find(params[:id])

    add_breadcrumb I18n.t("sound.plural"), :sounds_path
    add_breadcrumb @sound.name, sound_path(@sound)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sound }
    end
  end

  # GET /sounds/new
  # GET /sounds/new.json
  def new
    add_breadcrumb I18n.t("sound.plural"), :sounds_path

    @sound = Sound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sound }
    end
  end

  # GET /sounds/1/edit
  def edit
    @sound = Sound.find(params[:id])

    add_breadcrumb I18n.t("sound.plural"), :sounds_path
    add_breadcrumb @sound.name, sound_path(@sound)
  end

  # POST /sounds
  # POST /sounds.json
  def create
    @sound = Sound.new(params[:sound])

    respond_to do |format|
      if @sound.save
        format.html { redirect_to @sound, notice: 'Sound was successfully created.' }
        format.json { render json: @sound, status: :created, location: @sound }
      else
        format.html { render action: "new" }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sounds/1
  # PUT /sounds/1.json
  def update
    @sound = Sound.find(params[:id])

    respond_to do |format|
      if @sound.update_attributes(params[:sound])
        format.html { redirect_to @sound, notice: 'Sound was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sounds/1
  # DELETE /sounds/1.json
  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy

    respond_to do |format|
      format.html { redirect_to sounds_url }
      format.json { head :ok }
    end
  end

  private

  def sort_column
    %w[name].include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
