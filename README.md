# Capyspy

Mock js objects with capybara

## Installation

Add this line to your application's Gemfile:

    gem 'capyspy', group: :test

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capyspy

## Usage

    describe 'Details page', js: true do
      it 'should share article' do
        spy = spy_on 'share'
        
        page.evaluate_script 'share()'
        
        expect(spy).to have_been_called
        expect('share').to have_been_called
        expect(spy.calls).to have(1).item
      end
      
      it 'should delete article after confirm' do
        spy = spy_on('confirm').and_return true
        
        click_button 'Delete'
        
        expect(spy).to have_been_called
      end
      
      it 'should publish article' do
        spy = spy_on('alert').and_call_through
        
        click_button 'Publish'
        
        expect(spy).to have_been_called
        expect(spy.calls.last).to include 'You item was published'
      end
      
      it 'should share via facebook' do
        spy = spy_on('fbShare').and_call_fake 'function (id) { shareToFb(id); }'
        
        click_button 'Share via FB'
        
        expect(spy).to have_been_called
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
