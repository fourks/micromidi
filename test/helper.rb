dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + "/../lib"

require "minitest/autorun"
require "midi"

module TestHelper

  extend self

  def test_device
    @test_device ||= select_devices
  end

  def select_devices
    @test_device ||= {}
    { :input => UniMIDI::Input.all, :output => UniMIDI::Output.all }.each do |type, devs|
      puts ""
      puts "select an #{type.to_s}..."
      while @test_device[type].nil?
        devs.each do |device|
          puts device.pretty_name
        end
        selection = $stdin.gets.chomp
        if selection != ""
          selection = selection.to_i
          @test_device[type] = devs.find { |d| d.id == selection }
          puts "selected #{selection} for #{type.to_s}" unless @test_device[type]
        end
      end
    end
    @test_device
  end

end

TestHelper.select_devices
