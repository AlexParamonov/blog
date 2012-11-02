require_relative "stub_helper"

stub_class 'ActiveRecord::Base'
ActiveRecord::Base.stub(:belongs_to).as_null_object
ActiveRecord::Base.stub(:has_many).as_null_object
ActiveRecord::Base.stub(:attr_accessible).as_null_object
ActiveRecord::Base.stub(:table_name=).as_null_object
stub_class 'ActiveRecord::Calculations'
stub_class 'ActiveRecord::FinderMethods'
stub_class 'ActiveRecord::Relation'
stub_module 'FigLeaf'
ActiveRecord::Base.stub(:hide).as_null_object
ActiveRecord::Base.stub(:hide_singletons).as_null_object
