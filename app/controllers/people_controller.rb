# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show update destroy]

  # GET /people
  def index
    @people = Person.all
    result = @people.map do |person|
      { person: person, image: person.avatar_image_url }
    end
    render json: result
  end

  # GET /people/1
  def show
    render json: { person: @person, image: @person.avatar_image_url }
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: { person: @person, image: @person.avatar_image_url }
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def person_params
    params.require(:person).permit(:name, :email, :avatar)
  end
end
