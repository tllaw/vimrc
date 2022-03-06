set noswapfile is hls ic nu rnu si et sw=2 ts=2
let mapleader=","
nn <leader>ci i#include <bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>return 0;<CR>}<ESC>kO
nn <leader>cc :!g++ %<CR>:!for f in in/*; do echo "TEST: $f"; cat $f; ./a.out < $f; done<CR>
nn <leader>gc :!git add % && git commit -m "[+] %"<CR>
nn <leader>gl :!git log --oneline<CR>
nn <leader>gs :!git status<CR>
nn <leader>rm :!rm in/*<CR>
ab ll long long
ab ld long double
ab V vector<>
ab VI vector<int>
ab VLL vector<long long>
ab PQ priority_queue<>
ab PQI priority_queue<int>
ab PQIR priority_queue<int, vector<int>, greater<int>>
ab for for(long long i = 0; i < (n); i++)
ab forv for(auto i = (v); i != (v).begin(); i++)
ino pb push_back();<Left><Left>
ino cin cin >> ;<Left>
ino cout cout <<  << endl;<ESC>bbhi
ino fin ios::sync_with_stdio(0);<CR>cin.tie(0);<CR>
ino {} {<CR>;<CR>}<Up><Right>
ino to_s to_string()<Left>
