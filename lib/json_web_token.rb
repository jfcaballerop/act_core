class JsonWebToken
 class << self
   def encode(payload, exp = ENV["time_expired_min"].to_i.minutes.from_now)
    payload[:exp] = exp.to_i
    # binding.pry
    JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end