# == Schema Information
# Schema version: 20110524014116
#
# Table name: articles
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  body        :text
#  status      :text
#  date_posted :datetime
#  author_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Article < ActiveRecord::Base
  
  cattr_reader :per_page
    @@per_page = 5
  sort_record_by 'date_posted'
  validates_presence_of :title
  validates_presence_of :body
  validates_inclusion_of :status, :in => %w( Draft Posted )
  
  belongs_to :author, :foreign_key => "author_id"
  has_many :comments, :dependent => :delete_all
  
  before_save :fill_date

  def fill_date
    self.date_posted = Time.now.strftime("%Y-%m-%d %I:%M") if self.status.downcase.eql?("posted")
  end

end
