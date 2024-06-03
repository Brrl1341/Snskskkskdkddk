function Runsmsm(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(TheMero.."Name:Bot") or "لويس") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(TheMero) then
return false
end
if text then
local neww = Redis:get(TheMero.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(TheMero.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
if text == "تفعيل سمسمي" then
if not msg.Managers then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
Redis:del(TheMero.."smsme"..msg.chat_id)
send(msg.chat_id,msg.id,"• تم تفعيل سمسمي")
end
if text == "تعطيل سمسمي" then
if not msg.Managers then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
Redis:set(TheMero.."smsme"..msg.chat_id,true)
send(msg.chat_id,msg.id,"• تم تعطيل سمسمي")
end
if text == "تفعيل سمسمي عام" then
if not msg.ControllerBot then 
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(TheMero.."smsme")
send(msg.chat_id,msg.id,"• تم تفعيل سمسمي عام")
end
if text == "تعطيل سمسمي عام" then
if not msg.ControllerBot then 
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheMero.."smsme",true)
send(msg.chat_id,msg.id,"• تم تعطيل سمسمي عام")
end

if text and msg.reply_to_message_id ~= 0 and chat_type(msg.chat_id) == "GroupBot" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and tonumber(rep_idd) == tonumber(TheMero) then
local get = Redis:get(TheMero.."smsme") or Redis:get(TheMero.."smsme"..msg.chat_id)
if get then 
return false 
end
ai_api = https.request("http://a.a/api/simsim.php?T="..URL.escape(text))
ai_decode = JSON.decode(ai_api)
ai_text = ai_decode['success']
if ai_text:match("(.*)سناب(.*)") or ai_text:match("(.*) تيك (.*)") or ai_text:match("(.*)واتس(.*)") or ai_text:match("(.*)انستا(.*)") or ai_text:match("(.*)رقمي(.*)") or ai_text:match("(%d+)") or ai_text:match("(.*)متابعه(.*)") or ai_text:match("(.*)تابعني(.*)") or ai_text:match("(.*)قناتي(.*)") or ai_text:match("(.*)قناه(.*)") or ai_text:match("(.*)يوتيوب(.*)") then
txx = "لا افهمك"
else
txx = ai_text
end
send(msg.chat_id,msg.id,txx)
end
end

end

return {TheMero = Runsmsm}