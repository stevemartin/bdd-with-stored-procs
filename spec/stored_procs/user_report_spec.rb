require 'spec_helper'

describe 'the user report stored procedure' do
  before(:all) do
    @user_report = File.read('db/functions/user_report.sql')
    @res = ActiveRecord::Base.connection.execute @user_report
  end

  it 'should rebuild the function' do
    @res.should be_a PG::Result
  end

  it 'should exist' do
    stored_proc_exists?('generate_user_report').should == true
  end


  it 'should contain the stored proc' do
    stored_proc_src("generate_user_report").should == %q|
    DECLARE
      r record;
    BEGIN
    END
  |
  end
end

def arex sql
  ActiveRecord::Base.connection.execute sql
end

def stored_proc_exists? name
  res = arex("SELECT proname FROM pg_catalog.pg_proc WHERE proname = '#{name}'")
  res[0]['proname'] == name
end


def stored_proc_src name
  res = arex("select prosrc from pg_catalog.pg_proc where proname = '#{name}';")
  res[0]['prosrc']
end
