class Post < ActiveRecord::Base
  before_save :clean_links
  
  validates_presence_of :title
  validates_presence_of :body
  
  def clean_links
    
    doc = Nokogiri::HTML::DocumentFragment.parse(body)
    
    doc.css('a').each do |a|
      a[:rel] = 'nofollow'
      a[:target] = '_blank'
    end
    
    self.body = foc.to_s
  end
  
end
