# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = ApplicationController::BASE_URL


SitemapGenerator::Sitemap.create do

  Post.find_each do |post|
    add post_path(post)
  end
  
end
