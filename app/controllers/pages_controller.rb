class PagesController < ApplicationController
  def index
    render text: '', layout: 'application'
  end
end
