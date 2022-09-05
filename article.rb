require "nokogiri"
require "open-uri"
Post.delete_all
Category.delete_all
Author.delete_all
@doc=Nokogiri::HTML(URI.open("https://www.volksmuziekschool.com/blog/"))

@doc.css('.post').each do |post|
p=Post.new
p.title=post.css('.entry-title')[0].text
p.author=Author.new(name: post.css("[rel=author]")[0].text, url: post.css("[rel=author]")[0].attributes['href'].value.split('/').without('').last)
p.date=post.css("time")[0].text
p.url=post.css('[rel=bookmark]')[0].attributes['href'].value.split('/').without('').last
###
doc=Nokogiri::HTML(URI.open(post.css('a')[0].attributes['href'].value))
doc.css("article a[href*='category/']").each do |cat|
p.category = Category.find_or_initialize_by(name: cat.text, url: cat.attributes['href'].value.split('/').without('').last)
end
p post.css('.entry-content')[0].inner_html
p.content=post.css('.entry-content')[0].inner_html.strip.squish
p.save
###
end
