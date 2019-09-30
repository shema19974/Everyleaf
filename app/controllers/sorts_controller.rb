class SortsController < ApplicationController
  def index
    @tasks = Task.all.order('end_date DESC')
  end
end
