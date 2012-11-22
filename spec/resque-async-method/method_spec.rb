require 'spec_helper'

describe Resque::Plugins::Async::Method do

  context 'for valid record' do
    
    subject { MyKlass.new }
    
    before do
      Rails.env.stub test?: false
      subject.stub persisted?: true, id: 42
    end
    
    context 'with simple class' do
      
      class MyKlass
        include Resque::Plugins::Async::Method
    
        def foo
          'bar'
        end
        async_method :foo
      end

      it { MyKlass.respond_to?(:async_method).should be_true }

      context 'have defalut value' do
        it { Resque::Plugins::Async::Worker.queue.should eql(:async_methods) }
        it { Resque::Plugins::Async::Worker.loner.should be_false }
        it { Resque::Plugins::Async::Worker.lock_timeout.should eql(0) }
      end
      
      context 'alsways can be call method on sync mode' do
        it { subject.respond_to?(:sync_foo).should be_true }
        it { subject.sync_foo.should eql('bar') }
      end
  
      context 'and on async mode' do
    
        before do
          Resque.should_receive(:enqueue).with(Resque::Plugins::Async::Worker, 'MyKlass', 42, :sync_foo).and_return('it works')
        end
    
        its(:foo) { should eql 'it works' }
        
      end
      
    end # context 'with simple class' do
    
    context 'with queue named', pending: true do
    
      class MyKlass
        include Resque::Plugins::Async::Method
    
        def foo
          'bar'
        end
        async_method :foo, queue: :bar
      end
      
      it { Resque::Plugins::Async::Worker.queue.should eql(:bar) }
      it { Resque::Plugins::Async::Worker.loner.should be_false }
      it { Resque::Plugins::Async::Worker.lock_timeout.should eql(0) }
    
    end  

    context 'with loner', pending: true do
    
      class MyKlass
        include Resque::Plugins::Async::Method
    
        def foo
          'bar'
        end
        async_method :foo, loner: true
      end

      it { Resque::Plugins::Async::Worker.queue.should eql(:my_klasses) }
      it { Resque::Plugins::Async::Worker.loner.should be_true }
      it { Resque::Plugins::Async::Worker.lock_timeout.should eql(0) }
    
    end  

    context 'with lock_timeout' do
    
      class MyKlass
        include Resque::Plugins::Async::Method
    
        def foo
          'bar'
        end
        async_method :foo, lock_timeout: 2345
      end

      it { Resque::Plugins::Async::Worker.queue.should eql(:my_klasses) }
      it { Resque::Plugins::Async::Worker.loner.should be_true }
      it { Resque::Plugins::Async::Worker.lock_timeout.should eql(2345) }
    
    end  
  end
end