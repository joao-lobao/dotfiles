lua <<EOF
require'colorizer'.setup{
  css = { css = true; }; -- Enable parsing rgb(...) functions in css.
  scss = { css = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
}
EOF
