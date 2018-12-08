require 'sidekiq-scheduler'
require 'sinch_sms'

class HelloWorld
  include Sidekiq::Worker

  def perform
    SinchSms.send('93bb9173-eb0a-47c8-ba27-58f65dd42871', 'nAlKTDoHYk+qcqgH/Cir9g==', "Hello Rami, You have a task assigned", '+919095290768')
  	puts 'SMS Send'
  end
end