class User < ApplicationRecord
  before_save {self.email = email.downcase}
  has_many :posts
  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i  
  validates :username, presence: true, length: { in: 3..25 }, uniqueness: {case_sensitive: false}
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: {case_sensitive: false},format:{with:VALID_EMAIL_REGEX, :multiline => true}

  has_secure_password

end