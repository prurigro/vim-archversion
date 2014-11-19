" Vim syntax file
" Language: archversion.conf
" Maintainer: Kevin MacMartin (prurigro@gmail.com)
" Latest Revision: 19 November 2014

if exists("b:current_syntax")
  finish
endif

syn case match
syntax sync fromstart
setlocal iskeyword+=:,/,.,+,-,_,[,],?,=,&

" Main Keywords
syn keyword avVariable abs_path arch eval_compare eval_upstream eval_downstream repo retry timeout
hi def link avVariable Constant

" Comparisons (deprecated in newer versions of archversion)
syn keyword avCompareVariable compare contained
hi def link avCompareVariable Constant
syn keyword avCompare pacman archweb aur abs cache none contained
hi def link avCompare Type
syn match avCompareBlock "^ *compare *=.*" contains=avCompareVariable,avCompare

" Downstream
syn keyword avDownstreamVariable downstream contained
hi def link avDownstreamVariable Constant
syn keyword avDownstream pacman archweb aur abs cache none contained
hi def link avDownstream Type
syn match avDownstreamBlock "^ *downstream *=.*" contains=avDownstreamVariable,avDownstream

" URL
syn keyword avURLVariable url contained
hi def link avURLVariable Constant
syn match avURL 'https*:[^ ]*' contained
hi def link avURL Type
syn match avURLBlock "^ *url *=.*" contains=avURLVariable,avURL

" Regex
syn keyword avRegexVariable regex regex_name regex_version regex_ext regex_exclude contained
hi def link avRegexVariable Constant
syn match avRegex '.*' contained
hi def link avRegex String
syn match avRegexBlock "^\ *regex[^=]*=.*" contains=avRegexVariable,avRegex

" Version.Replace
syn region versionReplace start="version\.replace(" end=")"
hi def link versionReplace String

" Comments
syn match avComment "#.*$"
hi def link avComment Comment

" Headings
syn region avHeading start="\[" end="\]"
hi def link avHeading Special

let b:current_syntax = "archversion"
