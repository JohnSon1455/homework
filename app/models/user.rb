require 'digest'

class User < ApplicationRecord

  has_many :tasks, dependent: :destroy
  has_many :buckets, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password

  private
  def encrypt_password
    salted_pw = "c1#{self.password}css#{self.password}82$$c"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end
end
