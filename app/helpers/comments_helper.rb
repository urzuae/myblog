module CommentsHelper
  def author_link(comment)
    comment.url.blank? ? h(comment.author) : link_to(h(comment.author), comment.url)
  end
end
