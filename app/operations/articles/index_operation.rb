class Articles::IndexOperation < ApplicationOperation
  attr_reader :articles

  def call
    step_load_articles
  end

  def step_load_articles
    @articles = Article.all
  end
end
