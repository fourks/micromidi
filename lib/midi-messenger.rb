#!/usr/bin/env ruby

require 'unimidi'
require 'midi-message'

module MIDIMessenger
  
  VERSION = "0.0.1"
  
end

module MIDI

  def self.message(*ios, &block)
    ins = ios.find_all { |device| device.direction == :input }
    outs = ios.find_all { |device| device.direction == :output }
    MIDIMessenger::Context.new(ins, outs, &block)
  end  
  
end

#require 'forwardable'

require 'midi-messenger/context'
