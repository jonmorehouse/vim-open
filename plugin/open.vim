if exists("g:vim_open_loaded") || &cp
  finish
endif
let g:vim_open_loaded= 1

python <<EOF
import vim
import webbrowser
import re

def find_link(line):
  
  # Anything that isn't a square closing bracket
  name_regex = "[^]]+"
  # http:// or https:// followed by anything but a closing paren
  url_regex = "http[s]?://[^)]+"
  markup_regex = '\[({0})]\(\s*({1})\s*\)'.format(name_regex, url_regex)

  for match in re.findall(markup_regex, line):
    print match

def vim_open():
  
  link = find_link(str(vim.current.line))
  print link

EOF

command! VimOpen :python vim_open()


