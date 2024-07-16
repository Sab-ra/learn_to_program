# Missing track problem

Three hundred meters befor finish line of 600 km ride my Sigma has stopped, informing memory full.
Disaster.

I found the way how to get into it with my Mak terminal. 

First, i needed to install the utility to read the memory of the device. 

```bash
brew install libusb
```

Then I needed to mount the device. Another utility was needed. 

```bash
brew install lsusb
```

Then I needed to find the device. 

```bash
lsusb
```

That works. Now as I plug in Sigma to my Mac if do see it.

My 600K ride marked as `activity_uncompleted.fit` file.

Actions:

1. Copy the file to the local machine.
```bash
/Volumes % cp ROX\ 2_0/Activities/activity_uncompleted.fit ~/repos/learn_to_program/88_restore_fit_files/put_uncomplited_here 
```
2. Create a script in Ruby to recover the uncompleted activity using the ruby-fitparse gem.

```bash
gem install rubyfit
```

```bash
gem install nokogiri
```
Nokogiri is needed to parse the XML, in my case `gpx` file with the track.

So, now in needed to move my track to the same folder where the `activity_uncompleted.fit` file is.
I haven't found it in my device, so I took it from the source where I uploaded it before. 


```ruby
require 'rubyfit'
require 'nokogiri'

# Consider the original track

```

```ruby