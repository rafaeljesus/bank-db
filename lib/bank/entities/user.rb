require 'bcrypt'

module Bank
  module Entity
    class User < ActiveRecord::Base
      include BCrypt

      EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

      validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX, message: 'Invalid email' }
      validates :password, presence: true, length: { in: 6..20 }

      def valid_password?(user_password)
        password == user_password
      end

      def as_json(options = {})
        super(options.merge(except: [:crypted_password]))
      end

      def password
        return nil unless self.crypted_password.present?
        @password ||= Password.new(crypted_password)
      end

      def password=(value)
        return unless value.present?
        @password = value
        self.crypted_password = Password.create(value)
      end
    end
  end
end
