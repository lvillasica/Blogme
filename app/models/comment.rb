# == Schema Information
# Schema version: 20110524014116
#
# Table name: comments
#
#  id           :integer(4)      not null, primary key
#  email        :string(255)
#  body         :text
#  comment_date :datetime
#  article_id   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class Comment < ActiveRecord::Base
  
  sort_record_by 'id'
  validates_presence_of :email
  validates_presence_of :body
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  belongs_to :article, :foreign_key => "article_id"
  before_create :date_comment

  def date_comment
    self.comment_date = Time.now.strftime("%Y-%m-%d %I:%M")
  end

end
