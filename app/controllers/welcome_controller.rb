class WelcomeController < ApplicationController
  def index
    @q = Dictionary.ransack(params[:q])
     @dictionaries = @q.result(distinct: true)
  end
end
