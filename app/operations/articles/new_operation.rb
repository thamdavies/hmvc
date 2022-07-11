class Articles::NewOperation < ApplicationOperation
  def call
    step_init_form
  end

  def step_init_form
    @form = Article.new
  end
end
