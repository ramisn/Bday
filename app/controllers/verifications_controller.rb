class VerificationsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def generate_code
    phone_number = params["phone_number"]
    code = Random.rand(10000..99999).to_s
    Verification.create(phone_number: phone_number, code: code)
    SinchSms.send('93bb9173-eb0a-47c8-ba27-58f65dd42871', 'nAlKTDoHYk+qcqgH/Cir9g==', "Your OTP is #{code}", phone_number)
    # SinchSms.send('93bb9173-eb0a-47c8-ba27-58f65dd42871', 'nAlKTDoHYk+qcqgH/Cir9g==', "Happy BirthDay MyDear Kuttima", phone_number)
    render status: 200, json: {generated: true}.to_json
  end
  
  def verify_code
    phone_number = params["phone_number"]
    code = params["code"]
    verification = Verification.where(phone_number: phone_number, code: code).first
    if verification
       verification.destroy
        render status: 200, json: {verified: true}.to_json
    else
        render status: 200, json: {verified: false}.to_json
    end
  end

  def send_futuresms

		phone_number = params["phone_number"]

		current_time = (Time.now).strftime("%d-%m-%Y %I:%M %p")
		schedule = '04-12-2018 05:13 PM'
		puts schedule 
		puts current_time	
		while current_time == schedule
			puts "success" 
		end
  	render status: 200, json: {generated: true}.to_json
  end
end
