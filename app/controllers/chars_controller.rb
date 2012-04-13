class CharsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!, :only => [:edit, :new, :create, :update, :destroy]

  def home
  end

  # GET /chars
  # GET /chars.json
  def index
    add_breadcrumb I18n.t("char.plural"), :chars_path

    @chars = Char.search(params[:search]).includes(:script).order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chars }
      format.js
    end
  end

  # GET /chars/1
  # GET /chars/1.json
  def show
    @char = Char.find(params[:id])

    add_breadcrumb I18n.t("char.plural"), :chars_path
    add_breadcrumb @char.name, char_path(@char)

    @ancestors = @char.ancestors.arrange
    @children = @char.subtree.arrange(:order => :name).first.last

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @char }
    end
  end

  # GET /chars/new
  # GET /chars/new.json
  def new
    add_breadcrumb I18n.t("char.plural"), :chars_path

    @char = Char.new
    @parents_select = Char.all - [@char]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @char }
    end
  end

  # GET /chars/1/edit
  def edit
    @char = Char.find(params[:id])
    @parents_select = Char.all - [@char]

    add_breadcrumb I18n.t("char.plural"), :chars_path
    add_breadcrumb @char.name, char_path(@char)
  end

  # POST /chars
  # POST /chars.json
  def create
    @char = Char.new(:name => params[:char][:name], :description => params[:char][:description])
    @char.glyph = Glyph.find(params[:char][:glyph_id]) unless params[:char][:glyph_id].empty?
    @char.script = Script.find(params[:char][:script_id]) unless params[:char][:script_id].empty?

    params[:char][:sound_ids] ||= []
    @char.sound_ids = params[:char][:sound_ids]

    @char.parent = params[:char][:parent_id].empty? ? nil : Char.find(params[:char][:parent_id])

    respond_to do |format|
      if @char.save
        format.html { redirect_to @char, notice: 'Char was successfully created.' }
        format.json { render json: @char, status: :created, location: @char }
      else
        @parents_select = Char.all - [@char]
        format.html { render action: "new" }
        format.json { render json: @char.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chars/1
  # PUT /chars/1.json
  def update
    @char = Char.find(params[:id])
    @char.name = params[:char][:name]
    @char.description = params[:char][:description]
    @char.glyph = Glyph.find(params[:char][:glyph_id])
    @char.script = Script.find(params[:char][:script_id])

    params[:char][:sound_ids] ||= []
    @char.sound_ids = params[:char][:sound_ids]

    @char.parent = params[:char][:parent_id].empty? ? nil : Char.find(params[:char][:parent_id])

    respond_to do |format|
      if @char.save
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

  private

  def sort_column
    %w[scripts.name name].include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
