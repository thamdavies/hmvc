class Articles::CreateOperation < ApplicationOperation
  attr_reader :article

  def call
    step_validation { return }
    step_create_article!
  end

  def step_validation
    @form = Articles::CreateForm.new(article_params)
    return if form.valid?

    yield
  end

  def step_create_article!
    @article = Article.create!(
      title: form.title,
      content: form.content,
    )
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
