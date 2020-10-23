class WordsController < ApplicationController
  def new 
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to root_path
    end 
  end

  def index
    @words = Word.all
  end

  def show
    @word = set_word
    @word.status = true
    @word.save
  end

  def remove_all
    Word.delete_all
    flash[:notice] = "You have removed all results!"
    redirect_to root_path
  end

  def reset_all
    @words = Word.all
    @words.each do |word|
      word.status = false
      word.save
    end
    redirect_to words_path
  end

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:content, :status)
  end
end
