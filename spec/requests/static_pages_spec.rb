require 'spec_helper'

describe "StaticPages" do
    subject {page}
    describe "Home page" do

        before {visit root_path}
        it { should have_selector('title', text: 'Youtube video checker')}
        it { should have_selector('h1', text: 'Youtube video checker')} 

        # It should not have the alert message since there I didn't insert any link
        it { should_not have_selector('div.alert')}

    end  

    describe "Checking link" do
        before {visit root_path}
        let(:submit) { "Check video"}


        describe "when I clicked the button having an empty textbox" do
            before do
                click_button submit
            end

            it { should_not have_selector('div.alert')}
        end

        describe "when a video exists at that link" do
            before do
                fill_in "link",  with: "http://www.youtube.com/watch?v=bUtaLeQqB40"
                click_button submit
            end

            it{ should have_content('Youtube video was found!')}
        end

        describe "when a video does not exist at that link" do
            before do
                fill_in "link",  with: "http://www.youtube.com/watch?v=bUtLefQqB40"
                click_button submit
            end

            it{ should have_content('Youtube video not found!')}
        end

        # applies to Youtube links without an id of 11 characters
        # and NON- Youtube links( or input texts)
        describe "when the link doesn't seem to be a youtube link" do
            before do
                fill_in "link",  with: "http://www.youtube.com/watch?v=bUtLeQqB40"
                click_button submit
            end

            it{ should have_content('Please type a Youtube link')}
        end
    end   
 
end
