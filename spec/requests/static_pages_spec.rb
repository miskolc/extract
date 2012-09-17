require 'spec_helper'

describe "StaticPages" do
    subject {page}
    describe "Home page" do

        before {visit root_path}
        it { should have_selector('title', text: 'Youtube video checker')}
        it { should have_selector('h1', text: 'Youtube video checker')} 

    end    
 
end
