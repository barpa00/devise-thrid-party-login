class User < ApplicationRecord
    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true
    validates :nickname, presence: true



    def self.login(u)
        pw = Digest::SHA1.hexdigest("o#{u[:password]}o")
        User.find_by(email: u[:email], password: pw)
    end

    before_create :transp

    private
    def transp
        self.password = Digest::SHA1.hexdigest("o#{self.password}o")
    end

end
