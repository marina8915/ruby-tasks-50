$LOAD_PATH.unshift('.')

require 'tasks'
require 'test'

# Tests for tasks with real numbers and other
class Tests < Tasks::Task
  class << self
    def test_1
      result = { sum: 3, difference: -1, multiplication: 2 }
      Test.assert(expected: result, actual: task_1(a: 1, b: 2))
    end

    def test_2
      result = 0.3333
      Test.assert(expected: result, actual: task_2(x: 2.0, y: 1))
    end

    def test_24
      Test.assert(expected: 3, actual: task_24(x1: 2, x2: 2, y1: 1, y2: 4))
    end

    def test_30
      result = { result1: -584, result2: 586 }
      Test.assert(expected: result, actual: task_30(x: 5))
    end

    def test_33
      result = { min: 5, max: 10 }
      Test.assert(expected: result, actual: task_33(x: 5, y: 10))
    end

    def test_34
      result = { min: 5, max: 20 }
      Test.assert(expected: result, actual: task_34(x: 5, y: 10, z: 20))
    end

    def test_41
      Test.assert(expected: [], actual: task_41(x: 5, y: 10, z: 20))
    end

    def test_43
      Test.assert(expected: [4], actual: task_43(x: 2, y: -10, z: -20))
    end

    def test_62
      Test.assert(expected: 'yes', actual: task_62(digit: 4))
    end

    def test_64
      Test.assert(expected: 4, actual: task_64(digit: 400))
    end

    def test_65
      Test.assert(expected: 'no', actual: task_65(digit: 5))
    end

    def test_67
      result = { digits_number: 3, sum: 13,
                 last_digit: 6, first_digit: 2,
                 penultimate_number: 5 }
      Test.assert(expected: result, actual: task_67(digit: 256))
    end

    def test_207
      Test.assert(expected: 189, actual: task_207(n: 1_555_089))
    end

    def test_224
      Test.assert(expected: [1, 5, 25], actual: task_224(n: 25))
    end

    def test_225
      Test.assert(expected: [5], actual: task_225(n: 25))
    end

    def test_302
      Test.assert(expected: 3, actual: task_302(n: 2512))
    end

    def test_325
      Test.assert(expected: [1, 3, 5], actual: task_325(n: 15))
    end

    def test_328
      result = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, +
      41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
      Test.assert(expected: result, actual: task_328)
    end

    def test_555
      Test.assert(expected: [[1], [1, 1], [1, 2, 1]],
                  actual: task_555(n: 3))
    end

    def test_561
      Test.assert(expected: [1, 5], actual: task_561(n: 5))
    end
  end
end

# Tests for physics tasks
class TestPhysics < Tasks::Task
  class << self
    def test_9
      Test.assert(expected: 0.9375,
                  actual: task_9(resistance1: 2.5,
                                 resistance2: 3,
                                 resistance3: 1.5))
    end

    def test_10
      Test.assert(expected: { time: 1.35 }, actual: task_10(height: 9))
    end

    def test_13
      Test.assert(expected: { period: 2.84 },
                  actual: task_13(pendulum_length: 2))
    end
  end
end

# Tests for tasks with array
class TestArray < Tasks::Task
  class << self
    def test_number_array
      result = [2, 3]
      Test.assert(expected: result, actual: number_array(digit: 23))
    end

    def test_array_separators
      result = [1, 2, 3, 5, 7]
      Test.assert(expected: result, actual: array_separators(array: (1..10)))
    end

    def test_new_array_length
      array = new_array(quantity: 5, lower_bound: 1, top_bound: 10)
      Test.assert(expected: 5, actual: array.length)
    end

    def test_new_array_diapason
      array = new_array(quantity: 5, lower_bound: 1, top_bound: 10)
      array_check = array.select { |x| x > 10 || x < 1 }
      puts array_check
      Test.assert(expected: [], actual: array_check)
    end

    def test_182
      actual = task_182(n: 5)
      check = []
      actual[:arr_new].each do |x|
        check.push(x) if (x % 5).zero? && x % 7 != 0
      end
      Test.assert(expected: { arr_new: check,
                              sum: check.reduce(:+),
                              quantity: check.length },
                  actual: actual)
    end

    def test_185
      actual = task_185(n: 2)
      check = actual[:array].select { |elem| elem < 0 }
      Test.assert(expected: [], actual: check)
    end

    def test_191
      actual = task_191(n: 5)
      check = actual[:array].select { |x| x > 7 }
      Test.assert(expected: [], actual: check)
    end

    def test_205
      actual = task_205(n: 2)
      check = actual[:array]
      max = check.map(&:abs).max
      sum = Math.sqrt(check.map { |x| x * x }.reduce(:+))
      Test.assert(expected: { array: check, max: max, sum: sum },
                  actual: actual)
    end

    def test_272
      actual = task_272(n: 2)
      array_check = actual[:precipitation]
      average = array_check.reduce(:+) / array_check.size
      array_check2 = []
      array_check.each { |x| array_check2.push(x - average) }
      Test.assert(expected: { precipitation: array_check,
                              average: average,
                              deviation: array_check2 },
                  actual: actual)
    end

    def test_279
      actual = task_279(n: 5)
      a = actual[:array_a]
      b = actual[:array_b]
      ab = []
      (0..4).each { |i| ab.push(a[i] + b[i]) }
      Test.assert(expected: ab, actual: actual[:array_ab])
    end

    def test_536
      result = task_536(n: 5)
      check = result[:array] != result[:array].uniq ? 'yes' : 'no'
      Test.assert(expected: check, actual: result[:identical_elements])
    end
  end
end

# Tests for tasks with shapes
class TestShapes < Tasks::Task
  class << self
    def test_3
      result = { Volume: 8, Square: 24 }
      Test.assert(expected: result, actual: task_3(edge_length: 2))
    end

    def test_6
      result = { hypotenuse: 3.61, Square: 3.0 }
      Test.assert(expected: result,
                  actual: task_6(cathetus_a: 2.0, cathetus_b: 3))
    end

    def test_8
      Test.assert(expected: { Perimeter: 15_069.1871 },
                  actual: task_8(n_corners: 2.0, radius: 3))
    end

    def test_12
      Test.assert(expected: { Square: 315.67 },
                  actual: task_12(side_of_triangle: 9))
    end

    def test_15
      result = { cathetus_b: 8.77, Square: 0.89 }
      Test.assert(expected: result, actual: task_15(cathetus_a: 2,
                                                    hypotenuse: 9.0))
    end

    def test_16
      Test.assert(expected: { Square: 2.8 }, actual: task_16(circumference: 5))
    end

    def test_606
      Test.assert(expected: 'yes', actual: task_606(a: 5, b: 1, c: 2, d: 3))
    end
  end
end

# Tests for games
class TestGame < Tasks::Task
  class << self
    def test_hint
      result = 'less than needed'
      Test.assert(expected: result, actual: hint(digit1: 2, digit2: 3))
    end

    def test_horse_place
      Test.assert(expected: 'Victory!',
                  actual: horse_place(run: [1, 2, 3], horse_num: 3))
    end

    def test_task_986
      Test.assert(expected: 'incorrect value',
                  actual: task_986(n: 25))
    end

    def test_task_988
      Test.assert(expected: 'incorrect value', actual: task_988(horse_num: 5))
    end
  end
end

# Tests for tasks with matrix
class TestMatrix < Tasks::Task
  class << self
    def test_new_matrix_size
      result = Matrix.rows(new_matrix(n_lines: 3, m_lines: 4))
      Test.assert(expected: [3, 4], actual: [result.row_size,
                                             result.column_size])
    end

    def test_697
      actual = task_697(k: 2, m: 1, l: 3)
      result = actual[:matrix_a] * actual[:matrix_b]
      Test.assert(expected: { matrix_a: actual[:matrix_a],
                              matrix_b: actual[:matrix_b],
                              result: result },
                  actual: actual)
    end

    def test_698
      actual = task_698(n: 2)
      matrix = actual[:matrix]
      Test.assert(expected: { matrix: matrix, result: matrix**2 },
                  actual: actual)
    end

    def test_699
      actual = task_699(n: 2)
      matrix_a = actual[:matrix_a]
      matrix_b = actual[:matrix_b]
      result = matrix_a * matrix_b - matrix_b * matrix_a
      Test.assert(expected: { matrix_a: matrix_a,
                              matrix_b: matrix_b,
                              result: result },
                  actual: actual)
    end

    def test_704
      actual = task_704(n: 2)
      result = (actual[:matrix_a] + actual[:matrix_b]) * actual[:matrix_c]
      Test.assert(expected: { matrix_a: actual[:matrix_a],
                              matrix_b: actual[:matrix_b],
                              matrix_c: actual[:matrix_c],
                              result: result },
                  actual: actual)
    end
  end
end

# Tests for tasks with date
class TestDate < Tasks::Task
  class << self
    def test_822
      Test.assert(expected: '365 days', actual: task_822(year: 2018))
    end

    def test_823
      Test.assert(expected: 1, actual: task_823(n: 2018, m: 2021))
    end

    def test_831
      Test.assert(expected: Time.mktime(2018, 10, 7), actual: task_831(n: 2018))
    end
  end
end

Test.run_tests(test_class: Tests, tests: Tests)
Test.run_tests(test_class: TestArray, tests: TestArray)
Test.run_tests(test_class: TestDate, tests: TestDate)
Test.run_tests(test_class: TestGame, tests: TestGame)
Test.run_tests(test_class: TestMatrix, tests: TestMatrix)
Test.run_tests(test_class: TestShapes, tests: TestShapes)
Test.run_tests(test_class: TestPhysics, tests: TestPhysics)
