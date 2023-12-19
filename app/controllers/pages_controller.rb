class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    ids = Scene.pluck(:id)
    @first_scene = Scene.find(ids.delete(ids.sample))
    @second_scene = Scene.find(ids.delete(ids.sample))
    @third_scene = Scene.find(ids.delete(ids.sample))
  end
end
