#!/bin/bash

echo "Make sure you're root before installing the tools"
cd $HOME
sudo add-apt-repository -y ppa:longsleep/golang-backports &> /dev/null
sudo apt update &> /dev/null
sudo apt install -y amass golang-go python3-pip &> /dev/null
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mkdir -p $HOME/go/{bin,src,pkg}
chmod +x $HOME/go/bin
echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
source ~/.bashrc
echo -e "\nInstalling essential tools"
mkdir -p $HOME/tools/
git clone https://github.com/aboul3la/Sublist3r.git $HOME/tools/Sublist3r &> /dev/null
pip3 install -r $HOME/tools/Sublist3r/requirements.txt &> /dev/null
wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json $HOME/tools/ &> /dev/null 
wget https://github.com/OWASP/Amass/releases/download/v3.11.1/amass_linux_amd64.zip
unzip amass_linux_amd64.zip && mv amass /usr/bin/
echo -e "\nInstalling Go-lang tools"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &> /dev/null
go get -u github.com/tomnomnom/waybackurls &> /dev/null
go get -u github.com/tomnomnom/gf &> /dev/null
echo 'source $HOME/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir ~/.gf
cp -r $HOME/go/src/github.com/tomnomnom/gf/examples ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns &> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
GO111MODULE=on go get -u -v github.com/lc/gau &> /dev/null
go get -u -v github.com/lukasikic/subzy && cd $HOME/go/src/github.com/lukasikic/subzy && go mod init && go install &> /dev/null
go get github.com/haccer/subjack &> /dev/null
go get -u github.com/tomnomnom/assetfinder &> /dev/null
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx &> /dev/null
go get github.com/Emoe/kxss &> /dev/null
go get -u github.com/tomnomnom/qsreplace &> /dev/null
go get -u github.com/ffuf/ffuf &> /dev/null
git clone https://github.com/hahwul/dalfox && cd dalfox && go install &> /dev/null
go get -u github.com/tomnomnom/anew &> /dev/null
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei &> /dev/null
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify &> /dev/null
sudo cp $HOME/go/bin/* /usr/bin/
nuclei -update-templates &> /dev/null
git clone https://github.com/devanshbatham/ParamSpider $HOME/tools/ParamSpider && cd $HOME/tools/ParamSpider && sudo pip3 install -r requirements.txt
git clone https://github.com/maurosoria/dirsearch.git $HOME/tools/dirsearch && cd $HOME/tools/dirsearch && sudo pip3 install -r requirements.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt && mv big.txt $HOME/wordlists/big.txt
git clone https://github.com/m4ll0k/takeover $HOME/tools/takeover && cd $HOME/tools/takeover && python3 setup.py install
echo "alias takeover.py='python3 $HOME/tools/takeover/takeover.py'" >> ~/.bashrc
wget https://raw.githubusercontent.com/R0X4R/Garud/master/slack-bot.py ~/slack-bot.py
pip3 install slackclient slacker
echo -e "\n Please add your slack token in ~/slack-bot.py file"
echo -e "\n Please add your slack webhook in ~/.config/notify/notify.conf file"
source ~/.bashrc
