class Api::V1::MikvehsController < ApplicationController

  def index
    @mikvehs = Mikveh.all
    render json: @mikvehs
  end

end
