json.array! @messages do |message|
  json.message    message.message
  json.user_name  message.user.name
end
