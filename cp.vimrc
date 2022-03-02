set noswapfile is hls ic nu rnu si et sw=2 ts=2
let mapleader=","
nn <leader>cp i#include <bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>return 0;<CR>}<ESC>kO
nn <leader>cc :!g++ %<CR>:!for f in in/*; do echo "TEST: $f"; cat $f; ./a.out < $f; done<CR>
nn <leader>cg :!git add % && git commit -m "[+] %"<CR>
ab ll long long
ab int long long
ab V vector
ab PQ priority_queue
ab PQI priority_queue<long long>
ab PQIR priority_queue<long long, vector<long long>, greater<long long>>
ab for for(long long i = 0; i < (n); i++)
ab forv for(auto i = (v); i != (v).begin(); i++)
ino pb push_back()
ino cin cin >> ;<Left>
ino cout cout <<  << endl;<ESC>bbhi
ino fin ios::sync_with_stdio(0);<CR>cin.tie(0);<CR>
ino { {<CR>;<CR>}<Up>
