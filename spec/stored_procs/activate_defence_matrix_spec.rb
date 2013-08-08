require 'spec_helper'

describe 'the user report stored procedure' do
  before(:all) do
    @defence_matrix = File.read('db/functions/activate_defence_matrix.sql')
    @res = ActiveRecord::Base.connection.execute @defence_matrix
  end

  it 'should rebuild the function' do
    @res.should be_a PG::Result
  end

  it 'should exist' do
    stored_proc_exists?('activate_defence_matrix').should == true
  end


  it 'should contain the stored proc' do
    stored_proc_src("activate_defence_matrix").should == %q|
    DECLARE
      pilot_ids integer[];
    BEGIN
    END
  |
  end

  it 'should assign all the pilots to ion cannons' do

  end

end

def arex sql
  ActiveRecord::Base.connection.execute sql
end

def stored_proc_exists? name
  res = arex("SELECT proname FROM pg_catalog.pg_proc WHERE proname = '#{name}'")
  res = res.first
  if res
    return res['proname'] == name
  else
    false
  end
end


def stored_proc_src name
  res = arex("select prosrc from pg_catalog.pg_proc where proname = '#{name}';")
  res = res.first
  if res
    return res['prosrc']
  else
    false
  end

end
