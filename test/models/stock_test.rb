require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'should raise if name nil' do
    assert_raise ActiveRecord::StatementInvalid do
      Stock.create(name: nil, quantity: 0)
    end
  end

  test 'should raise if quantity nil' do
    assert_raise ActiveRecord::StatementInvalid do
      Stock.create(name: 'name', quantity: nil)
    end
  end

  test 'should not valide if quantity is negative ' do
    s = Stock.create(name: 'name', quantity: -999)
    pp s
    assert_not s.valid?
  end
end
