class ArticlesCell < Cell::Rails

  def recent
    @articles = Article.recent
    render
  end

end
