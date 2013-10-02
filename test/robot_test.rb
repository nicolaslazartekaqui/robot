require "./lib/robot.rb"
require 'test/unit'

class RobotTest < Test::Unit::TestCase
  def test_initialize
    robot = Robot.new(0,0,:N,10,10)

    assert_equal 0, robot.x
    assert_equal 0, robot.y
    assert_equal :N, robot.direction
    assert_equal 10, robot.limit_x
    assert_equal 10, robot.limit_y
  end

  def test_left
    robot = Robot.new(0,0,:N,10,10)

    assert_equal :W, robot.left
    assert_equal :S, robot.left
    assert_equal :E, robot.left
    assert_equal :N, robot.left
  end

  def test_right
    robot = Robot.new(0,0,:N,10,10)

    assert_equal :E, robot.right
    assert_equal :S, robot.right
    assert_equal :W, robot.right
    assert_equal :N, robot.right
  end

  def test_move
    robot = Robot.new(0,0,:N,10,10)

    # when move is valid
    # direction => N
    assert robot.move
    assert_equal 0, robot.x
    assert_equal 1, robot.y

    # direction => E
    robot.right
    assert robot.move
    assert_equal 1, robot.x
    assert_equal 1, robot.y

    # direction => S
    robot.right
    assert robot.move
    assert_equal 1, robot.x
    assert_equal 0, robot.y

    # direction => W
    robot.right
    assert robot.move
    assert_equal 0, robot.x
    assert_equal 0, robot.y

    # when move isnt valid
    # direction => W
    assert not(robot.move)
    assert_equal 0, robot.x
    assert_equal 0, robot.y

    robot.left
    # direction => S
    assert not(robot.move)
    assert_equal 0, robot.x
    assert_equal 0, robot.y

    # direction => E
    robot.teleport(10,10)
    robot.left
    assert not(robot.move)
    assert_equal 10, robot.x
    assert_equal 10, robot.y

    # direction => N
    robot.left
    assert not(robot.move)
    assert_equal 10, robot.x
    assert_equal 10, robot.y
  end

  def test_teleport
    robot = Robot.new(0,0,:N,10,10)

    # when position is valid
    assert robot.teleport(5,5)
    assert_equal 5, robot.x
    assert_equal 5, robot.y
 
    # when position isnt valid
    assert not(robot.teleport(11,11))
    assert_equal 5, robot.x
    assert_equal 5, robot.y
  end

  def test_to_s
    robot = Robot.new(0,0,:N,10,10)

    assert_equal "0 0 N", robot.to_s
  end
end
