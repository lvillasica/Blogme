# == Schema Information
# Schema version: 20110524014116
#
# Table name: authors
#
#  id         :integer(4)      not null, primary key
#  last_name  :string(255)
#  first_name :string(255)
#  remarks    :text
#  birthday   :date
#  created_at :datetime
#  updated_at :datetime
#

class Author < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "./no-image.jpeg"
  #default_scope order('last_name, first_name')
  sort_record_by 'last_name, first_name'
  #attr_accessor :photo_file_name
  #attr_accessor :photo_content_type
  #attr_accessor :photo_file_size
  #attr_accessor :photo_updated_at

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :remarks, :birthday, :photo
  cattr_reader :per_page
    @@per_page = 5

  validates_presence_of :last_name
  validates_presence_of :first_name

  has_many :articles, :dependent => :delete_all

  def full_name
    "#{last_name}, #{first_name}"
  end

end
