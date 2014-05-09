"if exists("g:vim_open_loaded") || &cp
  "finish
"endif
"let g:vim_open_loaded= 1

python <<EOF
import vim
import webbrowser
import re

def markdown_url(line):
  
  # Anything that isn't a square closing bracket
  name_regex = "[^]]+"
  # http:// or https:// followed by anything but a closing paren
  url_regex = "http[s]?://[^)]+"
  markup_regex = '\[({0})]\(\s*({1})\s*\)'.format(name_regex, url_regex)

  return [match[1] for match in re.findall(markup_regex, line)]

def plaintext_url(line):
  
  return re.findall(r'(https?://\S+)', line)

def vim_open():
  
  urls = markdown_url(vim.current.line)
  if not len(urls) > 0:
    urls = plaintext_url(vim.current.line)
  
  if not len(urls) > 0:
    return
  
  for url in urls:
    webbrowser.open(url)

EOF

command! VimOpen :python vim_open()


