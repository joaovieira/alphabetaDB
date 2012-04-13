class GlyphsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!

  # GET /glyphs
  # GET /glyphs.json
  def index
    add_breadcrumb I18n.t("glyph.plural"), :glyphs_path

    @glyphs = Glyph.order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glyphs }
      format.js
    end
  end

  # GET /glyphs/new
  # GET /glyphs/new.json
  def new
    add_breadcrumb I18n.t("glyph.plural"), :glyphs_path

    @glyph = Glyph.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glyph }
    end
  end

  # GET /glyphs/1/edit
  def edit
    @glyph = Glyph.find(params[:id])

    add_breadcrumb I18n.t("glyph.plural"), :glyphs_path
    add_breadcrumb @glyph.unicode, glyph_path(@glyph)
  end

  # POST /glyphs
  # POST /glyphs.json
  def create
    @glyph = Glyph.new(params[:glyph])

    respond_to do |format|
      if @glyph.save
        format.html { redirect_to glyphs_url, notice: 'Glyph was successfully created.' }
        format.json { render json: @glyph, status: :created, location: @glyph }
      else
        format.html { render action: "new" }
        format.json { render json: @glyph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glyphs/1
  # PUT /glyphs/1.json
  def update
    @glyph = Glyph.find(params[:id])

    respond_to do |format|
      if @glyph.update_attributes(params[:glyph])
        format.html { redirect_to glyphs_url, notice: 'Glyph was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @glyph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glyphs/1
  # DELETE /glyphs/1.json
  def destroy
    @glyph = Glyph.find(params[:id])
    @glyph.destroy

    respond_to do |format|
      format.html { redirect_to glyphs_url }
      format.json { head :ok }
    end
  end

  private

  def sort_column
    %w[unicode].include?(params[:sort]) ? params[:sort] : "unicode"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
