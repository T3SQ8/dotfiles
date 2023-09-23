set textwidth=0
let g:ledger_align_at=70

compiler ledger

inoremap <script> <silent> <buffer> today<tab> <c-r>=strftime("%Y-%m-%d")<cr>
