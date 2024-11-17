#!/bin/bash

# 检查是否以root用户运行脚本
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以root用户权限运行。"
    echo "请尝试使用 'sudo -i' 命令切换到root用户，然后再次运行此脚本。"
    exit 1
fi


echo "\$nrconf{kernelhints} = 0;" >> /etc/needrestart/needrestart.conf
echo "\$nrconf{restart} = 'l';" >> /etc/needrestart/needrestart.conf

source ~/.bashrc

sudo -i
sudo apt update 
sudo apt -y install golang-go
sudo apt -y install make
sudo apt -y install nodejs npm
sudo npm -y install pm2 -g

git clone https://github.com/masa-finance/masa-oracle.git
cd masa-oracle
cd contracts
npm install
cd ..

echo 'BOOTNODES=/ip4/52.6.77.89/udp/4001/quic-v1/p2p/16Uiu2HAmBcNRvvXMxyj45fCMAmTKD4bkXu92Wtv4hpzRiTQNLTsL,/ip4/3.213.117.85/udp/4001/quic-v1/p2p/16Uiu2HAm7KfNcv3QBPRjANctYjcDnUvcog26QeJnhDN9nazHz9Wi,/ip4/52.20.183.116/udp/4001/quic-v1/p2p/16Uiu2HAm9Nkz9kEMnL1YqPTtXZHQZ1E9rhquwSqKNsUViqTojLZt
RPC_URL=https://ethereum-sepolia.publicnode.com
ENV=test
FILE_PATH=.
VALIDATOR=false
PORT=8080
API_ENABLED=true
TWITTER_SCRAPER=true
TWITTER_ACCOUNTS=true
USER_AGENTS="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36,Mozilla/5.0 (Macintosh; Intel Mac OS X 14.7; rv:131.0) Gecko/20100101 Firefox/131.0"'>.env


##替换personalization_id
# v1_qsVh8eD3vl0opEDh/HT76w==
replace=$(grep -A1 "Name\": \"personalization_id\"" twitter_cookies.example.json | awk -F: '/Value"/ {print $2}' | tr -d '",')
replace=$(echo $replace | xargs)
sed -i "s#$replace#$personalization_id#" twitter_cookies.example.json


# kdt
# VFvblBBTi36TAJ4UO0Udi9X9dmoN04s84OsnkpJO
replace=$(grep -A1 "Name\": \"kdt\"" twitter_cookies.example.json | awk -F: '/Value"/ {print $2}' | tr -d '",')
replace=$(echo $replace | xargs)
sed -i "s#$replace#$kdt#" twitter_cookies.example.json

# twid
# 3D1748134319191969792
replace=$(grep -A1 "Name\": \"twid\"" twitter_cookies.example.json | awk -F: '/Value"/ {print $2}' | tr -d '",')
replace=$(echo $replace | xargs)
sed -i "s#$replace#$twid#" twitter_cookies.example.json

# ct0
# 15945099204e800fbe02de56dc3165f7f6eb72998cc2bc418a62f98cd755ba132d712c338829ae428d6dbecbc9d3a98595f0f79e5d5824fca9bf3445944c8a5d7902aae23d08cecf42ff1b4d97849021
replace=$(grep -A1 "Name\": \"ct0\"" twitter_cookies.example.json | awk -F: '/Value"/ {print $2}' | tr -d '",')
replace=$(echo $replace | xargs)
sed -i "s#$replace#$ct0#" twitter_cookies.example.json

# auth_token
# 18014776810f1f33629c6ad370f61813d175eecf
replace=$(grep -A1 "Name\": \"auth_token\"" twitter_cookies.example.json | awk -F: '/Value"/ {print $2}' | tr -d '",')
replace=$(echo $replace | xargs)
sed -i "s#$replace#$auth_token#" twitter_cookies.example.json

# att。退出登陆获取
# 1-lic2iPioEfjCtqhWizahV3s8P7N9ueG8SnWAH7TE
replace=$(grep -A1 "Name\": \"att\"" twitter_cookies.example.json | awk -F: '/Value"/ {print $2}' | tr -d '",')
replace=$(echo $replace | xargs)
sed -i "s#$replace#$att#" twitter_cookies.example.json

cp twitter_cookies.example.json "${usernmae}_twitter_cookies.json"



