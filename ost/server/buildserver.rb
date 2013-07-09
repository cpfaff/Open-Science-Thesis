#!/usr/bin/ruby

###------------------------------------------------------------------------------------%%
###------------------------------------------------------------------------------------%%
### Content: Open-Science-Thesis ruby build server
### Usage: Continous build your Open-Science-Thesis on changes
### Author: Claas-Thido Pfaff
###------------------------------------------------------------------------------------%%
###------------------------------------------------------------------------------------%%

# This requires you to install the fssm gem to work
# gem install fssm

require 'rubygems'
require 'fssm'

FSSM.monitor do
  path '.' do
    cmd = "make"
    glob ['*.Rnw','*.sty', '*.cls']
    update { system cmd }
    delete { system cmd }
    create { system cmd }
  end
end
