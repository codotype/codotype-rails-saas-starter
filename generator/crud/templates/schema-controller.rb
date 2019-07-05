# frozen_string_literal: true

class <%= schema.class_name_plural %>Controller < ApplicationController
  #   before_action :set_user, only: %i(update destroy)
  #   before_action :set_avatar, only: %i(update destroy)
  #   respond_to :json
  #   layout false
  before_action :set_user
  before_action :set_<%= schema.identifier %>, only: [:show, :edit, :update, :destroy]

  # GET /<%= schema.identifier_plural %>
  # GET /<%= schema.identifier_plural %>.json
  def index
    @<%= schema.identifier %>s = <%= schema.class_name %>.all
  end

  # GET /<%= schema.identifier_plural %>/1
  # GET /<%= schema.identifier_plural %>/1.json
  def show
  end

  # GET /<%= schema.identifier_plural %>/new
  def new
    @<%= schema.identifier %> = <%= schema.class_name %>.new
  end

  # GET /<%= schema.identifier_plural %>/1/edit
  def edit
  end

  # POST /<%= schema.identifier_plural %>
  # POST /<%= schema.identifier_plural %>.json
  def create
    @<%= schema.identifier %> = <%= schema.class_name %>.new(<%= schema.identifier %>_params)

    respond_to do |format|
      if @<%= schema.identifier %>.save
        format.html { redirect_to @<%= schema.identifier %>, notice: '<%= schema.label %> was successfully created.' }
        format.json { render :show, status: :created, location: @<%= schema.identifier %> }
      else
        format.html { render :new }
        format.json { render json: @<%= schema.identifier %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /<%= schema.identifier_plural %>/1
  # PATCH/PUT /<%= schema.identifier_plural %>/1.json
  def update
    respond_to do |format|
      if @<%= schema.identifier %>.update(<%= schema.identifier %>_params)
        format.html { redirect_to @<%= schema.identifier %>, notice: '<%= schema.label %> was successfully updated.' }
        format.json { render :show, status: :ok, location: @<%= schema.identifier %> }
      else
        format.html { render :edit }
        format.json { render json: @<%= schema.identifier %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /<%= schema.identifier_plural %>/1
  # DELETE /<%= schema.identifier_plural %>/1.json
  def destroy
    @<%= schema.identifier %>.destroy
    respond_to do |format|
      format.html { redirect_to <%= schema.identifier_plural %>_url, notice: '<%= schema.label %> was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sets the user
    def set_user
      @user = current_user
      raise Pundit::NotAuthorizedError if @user.blank?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_<%= schema.identifier %>
      @<%= schema.identifier %> = <%= schema.class_name %>.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def <%= schema.identifier %>_params
      params.require(:<%= schema.identifier %>).permit(<%= allowedParams %>)
    end
end
