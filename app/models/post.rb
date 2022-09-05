class Post < ApplicationRecord
has_many :posts_comments
has_many :comments, through: :posts_comments
has_many :othercomments, through: :comments, source: :comments
has_many :otherothercomments, through: :othercomments, source: :comments

belongs_to :category
belongs_to :author
def allcomments
comments.where(validated: true)
end
def mycomments(email)
comments.where(email: email)
end
before_validation :saveurl
def saveurl
self.url||=self.title.parameterize
end
def self.month(yyyy,mm)
where("cast(strftime('%Y',date) as int) = ? and cast(strftime('%m',date) as int) = ?",yyyy.to_i,mm.to_i)
end
def dd
self.date.day
end
def yyyy
self.date.year
end
def mm
self.date.month
end
def self.months

select("('/' || strftime('%Y',date) || '/'  ||strftime('%m',date)) as url,date as value").group("('/' || strftime('%Y',date) || '/'  ||strftime('%m',date) ) ,date ").as_json.pluck('url','value').map{|a,b|[a,b.to_date.strftime('%B %Y')]}
end
def self.mylast
order(:date => :desc).limit(5)
end
end
