# coding: utf-8
##!/usr/local/rvm/bin/ruby

require 'rubygems'

require 'xmpp4r/client'
include Jabber

jid = JID::new 'bot@yasla.net'
cl = Client.new jid
cl.connect
cl.auth 'password'
cl.send Presence.new

#msg = Message.new('asvavilov@jabber.ru', 'Hello world')
#cl.send msg

mainthread = Thread.current

cl.add_message_callback do |m|
	begin
		case m.type
		when :error, :headline
#			m2 = Message.new m.from, "#{m.type.upcase}: #{m.body}"
#			m2.type = :normal
#			cl.send m2
		else
			m2 = Message.new m.from, "Все говорят «#{m.body}», а ты купи слона."

			m2.type = m.type
			cl.send m2
#			if m.body == 'exit'
#				m2 = Message.new(m.from, "Exiting ...")
#				m2.type = m.type
#				cl.send(m2)
#				mainthread.wakeup
#			end
		end
	rescue =>err
		puts "#{err.message}\n#{err.backtrace.map do |s| "\t" + s end.join("\n")}"
		mainthread.wakeup
	end
end

#loop do
#m3 = Message.new 'asvavilov@jabber.ru', "#{rand}"
#cl.send m3
#sleep 5
#end

Thread.stop

cl.close
