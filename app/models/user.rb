class User < ActiveRecord::Base
  include Clearance::User


  PASSWORD_REGEX = /\A(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}\z/
  
  mount_uploaders :avatars, AvatarUploader
  
  has_many :authentications, :dependent => :destroy
  has_many :listings
  
  validates :first_name, :presence => true, :length => {:maximum => 70}
  validates :last_name, :presence => true, :length => {:maximum => 70}
  validates :password, :presence => true, :length => {:maximum => 70, :minimum => 8},
            :format => {:with => PASSWORD_REGEX, :message => "Password Must Contain 1 Capital Letter 1 small Letter and numbers"}



  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["extra"]["raw_info"]["first_name"]
      u.last_name = auth_hash['extra']['raw_info']["last_name"]
      u.gender = auth_hash['extra']['raw_info']["gender"]
      u.birthday = auth_hash['extra']['raw_info']["birthday"]
      u.phone_number = auth_hash['extra']['raw_info']["phone_number"]
      u.state = auth_hash['extra']['raw_info']["state"]
      u.country = auth_hash['extra']['raw_info']["country"]
      u.zip_code = auth_hash['extra']['raw_info']["zip_code"]
      u.password = "AaZx123234"
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"  
  end

end
