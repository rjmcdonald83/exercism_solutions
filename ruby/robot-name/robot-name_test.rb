require 'minitest/autorun'
require 'minitest/pride'
require_relative 'robot'

class RobotTest < MiniTest::Unit::TestCase
  def test_has_name
    assert_match /\w{2}\d{3}/, Robot.new.name
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    assert Robot.new.name != Robot.new.name
  end

  def test_reset_name
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    assert name != name2
    assert_match /\w{2}\d{3}/, name2
  end

  def test_names_do_not_conflict
    robot1 = Robot.new
    robot1.name = 'AB123'
    robot2 = Robot.new
    robot2.name = 'AB123'
    assert_raises 'Names must be unique, try again'
  end
end
