# coding: utf-8
##!/opt/rubyee/bin/ruby

require 'rubygems'

require 'xmpp4r-simple'

# что-то не работает отправка/получение сообщений
exit

cl = Jabber::Simple.new 'bot@yasla.net', 'jabberbot'

#mainthread = Thread.current

#cl.received_messages do |m|
#    cl.deliver(m.from, "Все говорят «#{msg.body}», а ты купи слона.") if m.type == :chat
#end

#Thread.stop

#cl.deliver 'asvavilov@jabber.ru', "Hello world #{rand}"

#cl.disconnect if cl.connected?
