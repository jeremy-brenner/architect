module Architect
  class TablesController < Architect::ApplicationController
    def index
      render json: schema
    end


end