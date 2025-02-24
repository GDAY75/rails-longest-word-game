require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ("A".."Z").to_a.sample }
  end
  def score
    @word = params[:word]
    @letters = params[:letters]
    dico = JSON.parse(URI.parse("https://dictionary.lewagon.com/#{@word}").read)
    d = @letters.split.sort.join.downcase.tr("^#{@word}", "").chars

    if dico["found"] == false
      @message = "Sorry not a english word"
    elsif (@word.length >= d.size)
      @message = "Sorry not good letters"
    else
      @message = "Good job!"
    end
  end
end
