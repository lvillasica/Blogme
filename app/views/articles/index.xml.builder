xml.instruct! :xml, :version=> '1.0', :encoding => 'UTF-8'
xml.article_index do
  @articles.each do |article|
    xml.article do
      xml.title(article.title)
      xml.body(article.body)
    end
  end
end
